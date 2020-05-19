

public class Printer {
  let prefixString: String

  public init(prefixStr: String) {
    prefixString = prefixStr
  }

  private var foo: String {
    return "Hello World"
  }

  public func printLog(str: String) {
    print("\(prefixString): \(str)")
  }

}
@frozen
public enum Foo {
  case bar
  case baz
}
