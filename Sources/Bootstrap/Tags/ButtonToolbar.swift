import Leaf
import TemplateKit

/// Button Toolbar
public final class ButtonToolbarTag: TagRenderer {
    private static let paramCount: Int = 2

    public func render(tag: TagContext) throws -> Future<TemplateData> {
        let body = try tag.requireBody()

        try tag.requireParameterCount(upTo: ButtonToolbarTag.paramCount)

        var classes = ""
        var aria = UUID().uuidString

        for index in 0...1 {
            if let param = tag.parameters[safe: index]?.string,
                param.isEmpty == false {

                switch index {
                case 0: classes = param
                case 1: aria = param
                default: break
                }
            }
        }

        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { er in
            let body = String(data: er.data, encoding: .utf8) ?? ""

            guard body.count > 0 else {
                throw tag.error(reason: "Body Data Expected")
            }

            var group = "<div class='btn-toolbar"
            if classes.count > 0 {
                group += " \(classes)"
            }
            group += "' role='toolbar' aira-label='\(aria)'>\(body)</div>"

            return .string(group)
        }
    }
}
