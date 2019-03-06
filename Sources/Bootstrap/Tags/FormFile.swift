import Leaf
import Sugar
import TemplateKit

public final class FormFile: TagRenderer {

  public func render(tag: TagContext) throws -> Future<TemplateData> {
    var classes = ""
    var attributes = ""

    try tag.requireNoBody()

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

    let c = "form-control \(classes)"
    let button = "<input type='file' class='\(c)' \(attributes)>"
    return Future.map(on: tag) { return .string(button) }
  }
}
