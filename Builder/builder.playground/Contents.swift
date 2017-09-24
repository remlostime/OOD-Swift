//: Playground - noun: a place where people can play

class Builder {
  var x: Int?
  var y: Int?
  var z: Int?
  
  init(_ builderWay: (Builder) -> Void) {
    builderWay(self)
  }
}

class Consumer: CustomStringConvertible {
  var x: Int?
  var y: Int?
  var z: Int?
  
  init(_ builder: Builder) {
    x = builder.x
    y = builder.y
    z = builder.z
  }
  
  var description: String {
    return "lalala: \(x), \(y), \(z)"
  }
}

let builder = Builder { builder in
  builder.x = 1
  builder.y = 2
  builder.z = 3
}

let consumer = Consumer(builder)

print(consumer)
