import Leaf

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
            "bs:textArea": TextAreaTag()
        ])
    }
}
