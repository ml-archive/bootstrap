import Leaf
import Sugar
import Vapor

extension LeafTagConfig {
    public mutating func useBootstrapLeafTags() {
        use([
          "bs:button": ButtonTag(),
          "bs:buttonGroup": ButtonGroupTag(),
          "bs:buttonToolbar": ButtonToolbarTag(),
          "bs:alert": AlertTag(),
          "bs:input": InputTag(),
          "bs:badge": BadgeTag(),
          "bs:breadCrumb": BreadCrumbTag(),
          "bs:breadCrumbItem": BreadCrumbItemTag(),
          "bs:textArea": TextAreaTag(),
          "bs:formRadio": FormRadio(),
          "bs:formCheckbox": FormCheckbox(),
          "bs:formFile": FormFile()
        ])
    }
}

extension TagContext {
    /// Throws an error if the parameter count is larger than the supplied number `n`.
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
