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
            "bs:button": ButtonTag(),
            "bs:buttonGroup": ButtonGroupTag(),
            "bs:buttonToolbar": ButtonToolbarTag(),
            "bs:alert": AlertTag(),
            "bs:input": InputTag(),
            "bs:badge": BadgeTag()
        ]
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

/// Bootstrap Color Definitions
///
enum ColorKeys: String {
    /// Bootstrap Primary Color
    case primary    = "primary"
    /// Bootstrap Secondary Color
    case secondary  = "secondary"
    /// Bootstrap Success Color
    case success    = "success"
    /// Bootstrap Danger Color
    case danger     = "danger"
    /// Bootstrap Warning Color
    case warning    = "warning"
    /// Bootstrap Info Color
    case info       = "info"
    /// Bootstrap Light Color
    case light      = "light"
    /// Bootstrap Dark Color
    case dark       = "dark"
}

