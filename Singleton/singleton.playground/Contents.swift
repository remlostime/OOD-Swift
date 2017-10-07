//: Playground - noun: a place where people can play

class Kai {
  static let shared = Kai()
  
  func printSomething() {
    print("I am the only Kai")
  }
  
  private init() {}
}

Kai.shared.printSomething()
