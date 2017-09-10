//: Playground - noun: a place where people can play

protocol Strategy {
  func printIt()
}

class Printer {
  private let strategy: Strategy

  init(_ strategy: Strategy) {
    self.strategy = strategy
  }

  func printIt() {
    strategy.printIt()
  }
}

class ColorPrint: Strategy {
  func printIt() {
    print("Color Print")
  }
}

class BlackPrint: Strategy {
  func printIt() {
    print("Black Print")
  }
}

let colorPrinter = Printer(ColorPrint())
colorPrinter.printIt()

let blackPrinter = Printer(BlackPrint())
blackPrinter.printIt()