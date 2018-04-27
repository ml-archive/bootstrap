import Vapor
import Leaf

public final class BootstrapProvider: Provider {
    public static let repositoryName = "bootstrap"

    public func register(_ services: inout Services) throws {
        try services.register(LeafProvider())
    }

    public func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        return .done(on: container)
    }
}

extension BootstrapProvider {
    public static var tags: [String: TagRenderer] {
        return [
            "bs:button": ButtonTag()
        ]
    }
}
