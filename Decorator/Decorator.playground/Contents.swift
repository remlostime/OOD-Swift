//: Playground - noun: a place where people can play

protocol Coffee {
  func cost() -> Double
  func name() -> String
}

class SimpleCoffee: Coffee {
  func cost() -> Double {
    return 1.35
  }

  func name() -> String {
    return "Simple Cofee"
  }
}

class SimpleCoffeeDecorator: Coffee {
  private let coffee: Coffee
  fileprivate let seprator = ","

  init(_ coffee: Coffee) {
    self.coffee = coffee
  }

  func cost() -> Double {
    return coffee.cost()
  }

  func name() -> String {
    return coffee.name()
  }
}

class MilkCoffeeDecorator: SimpleCoffeeDecorator {
  override func cost() -> Double {
    return super.cost() + 2
  }

  override func name() -> String {
    return super.name() + seprator + "Milk"
  }
}

let simpleCoffee = SimpleCoffee()

let milkCoffeeDecorator = MilkCoffeeDecorator(simpleCoffee)
milkCoffeeDecorator.cost()
milkCoffeeDecorator.name()