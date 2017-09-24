//: Playground - noun: a place where people can play

import Foundation

protocol NewClassProtocol {
  var x: Double { get }
  var y: Double { get }
}

class OldClass {
  let x: NSNumber
  let y: NSNumber
  
  init(x: NSNumber, y: NSNumber) {
    self.x = x
    self.y = y
  }
}

class Adapter: NewClassProtocol {
  private let oldClass: OldClass
  
  var x: Double {
    get {
      return oldClass.x.doubleValue
    }
  }
  
  var y: Double {
    get {
      return oldClass.y.doubleValue
    }
  }
  
  init(_ oldClass: OldClass) {
    self.oldClass = oldClass
  }
}

let oldClass = OldClass(x: NSNumber(value: 1), y: NSNumber(value: 2))
let adapter = Adapter(oldClass)
adapter.x
adapter.y

