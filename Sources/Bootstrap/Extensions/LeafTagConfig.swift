import Leaf

extension LeafTagConfig {
    public mutating func useBootstrapLeafTags() {
        use([
            "bs:alert": AlertTag(),
            "bs:badge": BadgeTag(),
            "bs:breadCrumb": BreadCrumbTag(),
            "bs:breadCrumbItem": BreadCrumbItemTag(),
            "bs:button": ButtonTag(),
            "bs:buttonGroup": ButtonGroupTag(),
            "bs:buttonToolbar": ButtonToolbarTag(),
            "bs:formCheckbox": FormCheckbox(),
            "bs:formFile": FormFile(),
            "bs:formRadio": FormRadio(),
            "bs:input": InputTag(),
            "bs:textArea": TextAreaTag(),
            "bs:card": CardTag(),
            "bs:card:outer": CardOuterTag(),
            "bs:card:header": CardHeaderTag(),
            "bs:card:body": CardBodyTag(),
            "bs:card:footer": CardFooterTag(),
        ])
    }
}
