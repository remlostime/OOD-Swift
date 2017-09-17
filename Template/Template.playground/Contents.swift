//: Playground - noun: a place where people can play

class Computer {
  func printBrandName() {
    print("Computer brand: \(brandName())")
  }

  func brandName() -> String {
    assertionFailure("Please provide brand name")

    return ""
  }
}

class Apple: Computer {
  override func brandName() -> String {
    return "Apple"
  }
}

class Dell: Computer {
  override func brandName() -> String {
    return "Dell"
  }
}

let apple = Apple()
apple.printBrandName()

let dell = Dell()
dell.printBrandName()

/* Will raise assert
 * let computer = Computer()
 * computer.printBrandName()
*/
