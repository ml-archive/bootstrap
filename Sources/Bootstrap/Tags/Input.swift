import Leaf
import TemplateKit

public final class InputTag: TagRenderer {
    enum Keys: String {
        case text = "text"
        case email = "email"
        case password = "password"
    }

    public func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        var inputType = "text"
        var classes = "form-control"
        var attributes = ""

        try tag.requireNoBody()

        for index in 0...2 {
            if
                let param = tag.parameters[safe: index]?.string,
                !param.isEmpty
            {
                switch index {
                case 0: inputType = param
                case 1: classes = param
                case 2: attributes = param
                default: ()
                }
            }
        }

        guard let parsedType = Keys(rawValue: inputType) else {
            throw tag.error(reason: "Wrong argument given: \(inputType)")
        }

        let button = "<input type='\(parsedType)' class='\(classes)' \(attributes)>"
        return Future.map(on: tag) { return .string(button) }
    }
}
