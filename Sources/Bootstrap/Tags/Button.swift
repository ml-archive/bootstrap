import Leaf
import TemplateKit

public final class ButtonTag: TagRenderer {
    enum Keys: String {
        case primary = "primary"
        case secondary = "secondary"
        case success = "success"
        case danger = "danger"
        case warning = "warning"
        case info = "info"
        case light = "light"
        case dark = "dark"
        case link = "link"
    }

    public func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        var style = "primary"
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
                throw tag.error(reason: "Wrong type given (expected a string): \(type(of: tag.parameters[0]))")
            }

            if param.count > 0 {
                classes = param
            }
        }

        if tag.parameters.count > 2 {
            guard let param = tag.parameters[2].string else {
                throw tag.error(reason: "Wrong type given (expected a string): \(type(of: tag.parameters[0]))")
            }

            if param.count > 0 {
                attributes = param
            }
        }

        guard let parsedType = Keys(rawValue: style) else {
            throw tag.error(reason: "Wrong argument given: \(style)")
        }

        // no required parameter
        // 1: optional-style, 2. optional-classes 3. optional-attributes
        // body: unescaped html

        guard let body = tag.body else {
            throw tag.error(reason: "Wrong body given: \(String(describing: tag.body))")
        }

        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { er in
            let button = "<button type=\"button\" class=\"btn btn-\(style) \(classes ?? "")\" \(attributes ?? "")>\(String(data: er.data, encoding: .utf8) ?? "")</button>"
            return .string(button)
        }
    }
}
