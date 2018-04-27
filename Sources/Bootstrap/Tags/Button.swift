import Leaf
import TemplateKit

public final class ButtonTag: TagRenderer {
    public enum Keys: String {
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
        let body = try tag.requireBody()

        var style = "primary"
        var classes = ""
        var attributes = ""

        if tag.parameters.count > 0 {
            guard let param = tag.parameters[0].string else {
                throw tag.error(
                    reason: "Wrong type given (expected a string): \(type(of: tag.parameters[0]))"
                )
            }

            if !param.isEmpty {
                style = param
            }
        }

        if tag.parameters.count > 1 {
            guard let param = tag.parameters[1].string else {
                throw tag.error(
                    reason: "Wrong type given (expected a string): \(type(of: tag.parameters[1]))"
                )
            }

            if !param.isEmpty {
                classes = param
            }
        }

        if tag.parameters.count > 2 {
            guard let param = tag.parameters[2].string else {
                throw tag.error(
                    reason: "Wrong type given (expected a string): \(type(of: tag.parameters[2]))"
                )
            }

            if !param.isEmpty {
                attributes = param
            }
        }

        guard let parsedStyle = Keys(rawValue: style) else {
            throw tag.error(reason: "Wrong argument given: \(style)")
        }

        // no required parameter
        // 1: optional-style, 2. optional-classes 3. optional-attributes
        // body: unescaped html

        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { body in
            let c = "btn btn-\(parsedStyle) \(classes)"
            let b = String(data: body.data, encoding: .utf8) ?? ""

            let button = "<button class='\(c)' \(attributes)>\(b)</button>"
            return .string(button)
        }
    }
}
