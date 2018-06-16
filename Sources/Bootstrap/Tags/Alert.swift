import Leaf
import TemplateKit

/// Bootstrap Alert Tag
public final class AlertTag: TagRenderer {
    public func render(tag: TagContext) throws -> Future<TemplateData> {
        var style = ColorKeys.primary.rawValue
        var classes: String?
        var attributes: String?

        if tag.parameters.count > 0 {
            guard let param = tag.parameters[0].string else {
                throw tag.error(reason: "Wrong type given (expected a string): \(type(of: tag.parameters[0]))")
            }

            if param.count > 0 {
                style = param
            }
        }

        if tag.parameters.count > 1 {
            guard let param = tag.parameters[1].string else {
                throw tag.error(reason: "Wrong type given (expected a string): \(type(of: tag.parameters[1]))")
            }

            if param.count > 0 {
                classes = param
            }
        }

        if tag.parameters.count > 2 {
            guard let param = tag.parameters[2].string else {
                throw tag.error(reason: "Wrong type given (expected a string): \(type(of: tag.parameters[2]))")
            }

            if param.count > 0 {
                attributes = param
            }
        }

        guard let parsedStyle = ColorKeys(rawValue: style) else {
            throw tag.error(reason: "Wrong argument given: \(style)")
        }

        guard let body = tag.body else {
            throw tag.error(reason: "Wrong body given: \(String(describing: tag.body))")
        }

        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { er in
            let body = String(data: er.data, encoding: .utf8) ?? ""

            var alert = "<div class=\"alert alert-\(parsedStyle)"
            if let classes = classes {
                alert += " \(classes)"
            }

            alert += "\" \(attributes ?? "") role='alert'>\(body)</div>"

            return .string(alert)
        }
    }
}
