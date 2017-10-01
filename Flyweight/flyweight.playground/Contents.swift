//: Playground - noun: a place where people can play

class Coffee: CustomStringConvertible {
  let name: String
  
  init(_ name: String) {
    self.name = name
  }
  
  var description: String {
    get {
      return name
    }
  }
}

class Menu {
  private let coffee: [String: Coffee]
  
  init(_ coffee: [String: Coffee]) {
    self.coffee = coffee
  }
  
  func lookup(_ name: String) -> Coffee? {
    return coffee[name]
  }
}

class CoffeeShop {
  private var order: [Int: Coffee] = [:]
  private let menu: Menu
  
  init(_ menu: Menu) {
    self.menu = menu
  }
  
  func takeOrder(name: String, table: Int) -> Bool {
    if let coffee = menu.lookup(name) {
      order[table] = coffee
      return true
    }
    
    return false
  }
  
  func serve() {
    for (table, coffee) in order {
      print("table: \(table), coffee: \(coffee)")
    }
  }
}

let coffee1 = Coffee("coffee1")
let coffee2 = Coffee("coffee2")
let menu = Menu(["coffee1": coffee1, "coffee2": coffee2])
let coffeeShop = CoffeeShop(menu)
coffeeShop.takeOrder(name: "coffee1", table: 1)
coffeeShop.takeOrder(name: "coffee2", table: 2)
coffeeShop.takeOrder(name: "asdf", table: 3)
coffeeShop.serve()
