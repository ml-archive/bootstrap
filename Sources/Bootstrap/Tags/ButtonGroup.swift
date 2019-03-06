import Leaf
import Sugar
import TemplateKit

/// Bootstrap Button Group Tag
public final class ButtonGroupTag: TagRenderer {
    enum GroupKeys: String {
        case standard = "btn-group"
        case vertical = "btn-group-vertical"
    }

    private static let paramCount: Int = 3

    public func render(tag: TagContext) throws -> Future<TemplateData> {
        let body = try tag.requireBody()

        try tag.requireParameterCount(upTo: ButtonGroupTag.paramCount)

        var group = GroupKeys.standard
        var classes: String?
        var aria = UUID().uuidString

        if tag.parameters.count > 0 {
            guard let param = tag.parameters[0].bool else {
                throw tag.error(
                    reason: "Wrong type given (expected a bool): \(type(of: tag.parameters[0]))"
                )
            }

            if param {
                group = .vertical
            }
        }

        if tag.parameters.count > 1 {
            guard let param = tag.parameters[1].string else {
                throw tag.error(
                    reason: "Wrong type given (expected a string): \(type(of: tag.parameters[1]))"
                )
            }

            if param.count > 0 {
                classes = param
            }
        }

        if tag.parameters.count > 2 {
            guard let param = tag.parameters[2].string else {
                throw tag.error(
                    reason: "Wrong type given (expected a string): \(type(of: tag.parameters[2]))"
                )
            }

            if param.count > 0 {
                aria = param
            }
        }

        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { er in
            let body = String(data: er.data, encoding: .utf8) ?? ""

            /// Button Group isn't useful without a body
            guard body.count > 0 else {
                throw tag.error(reason: "Body Data Expected")
            }

            var group = "<div class='\(group.rawValue)"
            if let classes = classes {
                group += " \(classes)"
            }
            group += "' role='group' aira-label='\(aria)'>\(body)</div>"

            return .string(group)
        }
    }
}
