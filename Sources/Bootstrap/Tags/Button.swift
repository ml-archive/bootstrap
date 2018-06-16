import Leaf
import TemplateKit

public final class ButtonTag: TagRenderer {
    public func render(tag: TagContext) throws -> Future<TemplateData> {
        let body = try tag.requireBody()

        var style = ColorKeys.primary.rawValue
        var classes = ""
        var attributes = ""

        for index in 0...2 {
            if
                let param = tag.parameters[safe: index]?.string,
                !param.isEmpty
            {
                switch index {
                case 0: style = param
                case 1: classes = param
                case 2: attributes = param
                default: ()
                }
            }
        }

        guard let parsedStyle = Keys(rawValue: style) else {
            throw tag.error(reason: "Wrong argument given: \(style)")
        }

        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { body in
            let c = "btn btn-\(parsedStyle) \(classes)"
            let b = String(data: body.data, encoding: .utf8) ?? ""

            let button = "<button class='\(c)' \(attributes)>\(b)</button>"
            return .string(button)
        }
    }
}
