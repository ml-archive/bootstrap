# Bootstrap 🍃

A Leaf wrapper for Bootstrap


# Installation

In your configure.swift file:

```
/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {

    /// Register providers first
    try services.register(BootstrapProvider())

    ....
    
    services.register { _ -> LeafTagConfig in
        var tags = LeafTagConfig.default()
        
        for tag in BootstrapProvider.tags {
            tags.use(tag.value, as: tag.key)
        }
        return tags
    }
}
```

# Getting started 🚀

## Tags Supported

Button Group

```
#bs:buttonGroup(isVertical, classExtras?, Aria?) { }
```

Button Toolbar

```
#bs:buttonToolbar(classExtras?, Aria?) { }
```


## Example of Leaf

```
#bs:buttonGroup(false, "btn-group-sm") {
#bs:button() { First Option }
#bs:button("danger") { Second Option}
#bs:button() { Third Option}
}

```

```
#bs:buttonToolbar() {
#bs:button() { First Option }
#bs:button("danger") { Second Option}
#bs:button() { Third Option}
}

```

## 🏆 Credits

This package is developed and maintained by the Vapor team at [Nodes](https://www.nodesagency.com).


## 📄 License

This package is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
