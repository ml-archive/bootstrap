import Leaf
import TemplateKit

private func makeCardHeader(_ parameters: [TemplateData]) -> String {
    var title: String?
    var classes = ""
    var attributes = ""
    
    for index in 0...2 {
        if let param = parameters[safe: index]?.string,
            !param.isEmpty {
            switch index {
            case 0: title = param
            case 1: classes = param
            case 2: attributes = param
            default: break
            }
        }
    }
    
    var titlePart = ""
    if let title = title {
        titlePart = "<h5 class=\"card-header\">\(title)</h5>\n"
    }
    
    return """
    <div class="card \(classes)" \(attributes)>
    \(titlePart)
    """
}

public final class CardTag: TagRenderer {
    public func render(tag: TagContext) throws -> Future<TemplateData> {
        let body = try tag.requireBody()
        
        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { body in
            let b = String(data: body.data, encoding: .utf8) ?? ""
            
            return .string("""
                \(makeCardHeader(tag.parameters))
                <div class="card-body">
                \(b)
                </div>
                </div>
                """)
        }
    }
}

public final class CardOuterTag: TagRenderer {
    public func render(tag: TagContext) throws -> Future<TemplateData> {
        let body = try tag.requireBody()
        
        return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { body in
            let b = String(data: body.data, encoding: .utf8) ?? ""
            
            return .string("""
                \(makeCardHeader(tag.parameters))
                \(b)
                </div>
                """)
        }
    }
}

fileprivate func renderCardPart(_ tag: TagContext, _ tagClass: String) throws -> Future<TemplateData> {
    let body = try tag.requireBody()
    
    var classes = ""
    var attributes = ""
    
    for index in 0...2 {
        if let param = tag.parameters[safe: index]?.string,
            !param.isEmpty {
            switch index {
            case 0: classes = param
            case 1: attributes = param
            default: break
            }
        }
    }
    
    return tag.serializer.serialize(ast: body).map(to: TemplateData.self) { body in
        let b = String(data: body.data, encoding: .utf8) ?? ""
        
        return .string("""
            <div class="\(tagClass) \(classes)" \(attributes)>
            \(b)
            </div>
            """)
    }
}

public final class CardHeaderTag: TagRenderer {
    public func render(tag: TagContext) throws -> Future<TemplateData> {
        return try renderCardPart(tag, "card-header")
    }
}

public final class CardBodyTag: TagRenderer {
    public func render(tag: TagContext) throws -> Future<TemplateData> {
        return try renderCardPart(tag, "card-body")
    }
}

public final class CardFooterTag: TagRenderer {
    public func render(tag: TagContext) throws -> Future<TemplateData> {
        return try renderCardPart(tag, "card-footer")
    }
}
