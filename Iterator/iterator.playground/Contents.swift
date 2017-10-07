//: Playground - noun: a place where people can play

struct Girl {
  let name: String
}

struct Girls {
  let girls: [Girl]
}

struct GirlsIterator: IteratorProtocol {
  
  private var current = 0
  private let girls: [Girl]
  
  init(_ girls: [Girl]) {
    self.girls = girls
  }
  
  mutating func next() -> Girl? {
    defer {
      current += 1
    }
    
    return girls.count > current ? girls[current] : nil
  }
}

extension Girls: Sequence {
  func makeIterator() -> GirlsIterator {
    return GirlsIterator(girls)
  }
}

let girls = [Girl(name: "lifan"), Girl(name: "gujie")]
girls.forEach { girl in
  print(girl.name)
}
