# Bootstrap 🍃

[![Swift Version](https://img.shields.io/badge/Swift-4.1-brightgreen.svg)](http://swift.org)
[![Vapor Version](https://img.shields.io/badge/Vapor-3-30B6FC.svg)](http://vapor.codes)
[![Circle CI](https://circleci.com/gh/nodes-vapor/bootstrap/tree/master.svg?style=shield)](https://circleci.com/gh/nodes-vapor/bootstrap)
[![codebeat badge](https://codebeat.co/badges/40b8811e-2949-427a-a2a7-437209475f7d)](https://codebeat.co/projects/github-com-nodes-vapor-bootstrap-master)
[![codecov](https://codecov.io/gh/nodes-vapor/bootstrap/branch/master/graph/badge.svg)](https://codecov.io/gh/nodes-vapor/bootstrap)
[![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/nodes-vapor/bootstrap)](http://clayallsopp.github.io/readme-score?url=https://github.com/nodes-vapor/bootstrap)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/nodes-vapor/bootstrap/master/LICENSE)

This package wraps Bootstrap elements into convenient Leaf-Tags.


# Installation

Update your `Package.swift` file.
```swift
.package(url: "https://github.com/nodes-vapor/bootstrap.git", from: "1.0.0")
```

## Getting started 🚀

First import Bootstrap and Leaf inside your `configure.swift`

```swift
import Bootstrap
import Leaf
```

### Adding the provider

```swift
try services.register(BootstrapProvider())
```

### Adding the Leaf tags

#### Using a shared Leaf tag config

This package supports using a shared Leaf tag config which removes the task of registering the tags from the consumer of this package. Please see [this description](https://github.com/nodes-vapor/sugar#mutable-leaf-tag-config) if you want to use this.

#### Manually registering the Leaf tag(s)

```swift 
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    services.register { _ -> LeafTagConfig in
        var tags = LeafTagConfig.default()
        tags.use(ButtonTag(), as: "bs:button")
        tags.use(ButtonGroupTag(), as: "bs:buttonGroup")
        tags.use(ButtonToolbarTag(), as: "bs:buttonToolbar")
        tags.use(AlertTag(), as: "bs:alert")
        tags.use(InputTag(), as: "bs:input")
        tags.use(BadgeTag(), as: "bs:badge")
        tags.use(BreadCrumbTag(), as: "bs:breadCrumb")
        tags.use(BreadCrumbItemTag(), as: "bs:breadCrumbItem")

        return tags
    }
}
```

## Supported tags

- [Alert](#alert)
- [Badge](#badge)
- [Button](#button)
- [Button Group](#button-group)
- [Button Toolbar](#button-toolbar)
- [Input](#input)
- [Breadcrumb](#breadcrumb)
- [Textarea](#textarea)

### Alert

```
#bs:alert() { alert text }
```

### Badge

```
#bs:badge(type?, classExtras?, attributes?) { badge text }
```

### Button

```
#bs:button(type?, classExtras?, attributes?) { btn text }
```

### Button Group

```
#bs:buttonGroup(isVertical, classExtras?, Aria?) { }
```

```
#bs:buttonGroup(false, "btn-group-sm") {
    #bs:button() { First Option }
    #bs:button("danger") { Second Option}
    #bs:button() { Third Option}
}

```

### Button Toolbar

```
#bs:buttonToolbar(classExtras?, Aria?) { }
```

```
#bs:buttonToolbar() {
    #bs:button() { First Option }
    #bs:button("danger") { Second Option}
    #bs:button() { Third Option}
}
```

### Input

```
#bs:input(type?, classExtras?, attributes?)
```

### Breadcrumb

```
#bs:breadcrumb(classExtras?, attributes?) {
  #bs:breadcrumbItem(classExtras?, attributes?) { <a href="/"> Home </a> }
  #bs:breadcrumbItem(classExtras?, attributes?) { Profile }
}
```

### Textarea

```
#bs:textArea(classExtras?, attributes?, value?)
```

## 🏆 Credits

This package is developed and maintained by the Vapor team at [Nodes](https://www.nodesagency.com). The package owner for this project is [Martin](http://github.com/martinlasek).


## 📄 License

This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
