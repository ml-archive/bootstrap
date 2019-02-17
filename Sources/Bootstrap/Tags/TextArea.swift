import Leaf
import Sugar
import TemplateKit

public final class TextAreaTag: TagRenderer {
    private static let paramCount: Int = 3

    public func render(tag: TagContext) throws -> Future<TemplateData> {
        try tag.requireNoBody()
        try tag.requireParameterCount(upTo: TextAreaTag.paramCount)

        var classes = "form-control"
        var attributes = "rows='3'"
        var value = ""

        for index in 0...2 {
            if
                let param = tag.parameters[safe: index]?.string,
                !param.isEmpty
            {
                switch index {
                case 0: classes = param
                case 1: attributes = param
                case 2: value = param
                default: break
                }
            }
        }

        let html = "<textarea class='\(classes)' \(attributes)>\(value)</textarea>"
        return tag.future(.string(html))
    }
}
