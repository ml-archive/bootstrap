import Leaf
import TemplateKit

public final class BreadCrumbTag: TagRenderer {

    public func render(tag: TagContext) throws -> Future<TemplateData> {
        let body = try tag.requireBody()
        var classes = ""
        var attributes = ""

        for index in 0...1 {
            if
                let param = tag.parameters[safe: index]?.string,
                !param.isEmpty
            {
                switch index {
                case 0: classes = param
                case 1: attributes = param
                default: ()
                }
            }
        }

        return tag.serializer.serialize(ast: body).map { body in
            let b = String(data: body.data, encoding: .utf8) ?? ""

            let breadcrumb = """
                <div class='\(classes)' \(attributes) aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        \(b)
                    </ol>
                </div>
            """
            return .string(breadcrumb)
        }
    }
}

public final class BreadCrumbItemTag: TagRenderer {
    public func render(tag: TagContext) throws -> EventLoopFuture<TemplateData> {
        let body = try tag.requireBody()
        var classes = ""
        var attributes = ""

        for index in 0...2 {
            if
                let param = tag.parameters[safe: index]?.string,
                !param.isEmpty
            {
                switch index {
                case 0: classes = param
                case 1: attributes = param
                default: ()
                }
            }
        }

        return tag.serializer.serialize(ast: body).map { body in
            let c = "breadcrumb-item \(classes)"
            let b = String(data: body.data, encoding: .utf8) ?? ""
            let breadcrumbItem = "<li class='\(c)' \(attributes)>\(b)</li>"
            return .string(breadcrumbItem)
        }
    }
}
