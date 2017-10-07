//: Playground - noun: a place where people can play

protocol VisitorProtocol {
  func visit(_ planet: APlanet)
  func visit(_ planet: BPlanet)
}

protocol Planet {
  func accept(visitor: VisitorProtocol)
}

class APlanet: Planet {
  func accept(visitor: VisitorProtocol) {
    visitor.visit(self)
  }
}

class BPlanet: Planet {
  func accept(visitor: VisitorProtocol) {
    visitor.visit(self)
  }
}

class Visitor: VisitorProtocol {
  func visit(_ planet: APlanet) {
    name = "APlanet"
  }
  
  func visit(_ planet: BPlanet) {
    name = "BPlanet"
  }
  
  var name = ""
}

let planets: [Planet] = [APlanet(), BPlanet()]
let names = planets.map { (planet: Planet) -> String in
  let visitor = Visitor()
  planet.accept(visitor: visitor)
  
  return visitor.name
}

print(names)
