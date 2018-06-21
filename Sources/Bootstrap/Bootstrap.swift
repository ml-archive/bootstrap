import Leaf
import Sugar
import Vapor

public final class BootstrapProvider: Provider {
    public static let repositoryName = "bootstrap"

    public init() {}

    public func register(_ services: inout Services) throws {
        try services.register(LeafProvider())
        try services.register(MutableLeafTagConfigProvider())
    }

    public func didBoot(_ container: Container) throws -> EventLoopFuture<Void> {
        let tags: MutableLeafTagConfig = try container.make()
        tags.use(ButtonTag(), as: "bs:button")
        tags.use(ButtonGroupTag(), as: "bs:buttonGroup")
        tags.use(ButtonToolbarTag(), as: "bs:buttonToolbar")
        tags.use(AlertTag(), as: "bs:alert")
        tags.use(InputTag(), as: "bs:input")
        tags.use(BadgeTag(), as: "bs:badge")
        tags.use(BreadCrumbTag(), as: "bs:breadCrumb")
        tags.use(BreadCrumbItemTag(), as: "bs:breadCrumbItem")

        return .done(on: container)
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension TagContext {
    /// Throws an error if the parameter count contains more then the supplied number `n`.
    public func requireParameterCount(upTo n: Int) throws {
        guard parameters.count <= n else {
            throw error(reason: "Invalid parameter count: \(parameters.count)/\(n)")
        }
    }
}

/// Bootstrap Color Definitions
enum ColorKeys: String {
    /// Bootstrap Primary Color
    case primary
    /// Bootstrap Secondary Color
    case secondary
    /// Bootstrap Success Color
    case success
    /// Bootstrap Danger Color
    case danger
    /// Bootstrap Warning Color
    case warning
    /// Bootstrap Info Color
    case info
    /// Bootstrap Light Color
    case light
    /// Bootstrap Dark Color
    case dark
}
