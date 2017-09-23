//: Playground - noun: a place where people can play

import Foundation

class Facade {
  static func set(_ value: Any?, for key: String) {
    let userDefault = UserDefaults.standard
    userDefault.set(value, forKey: key)
    userDefault.synchronize()
  }
  
  static func object(for key: String) -> Any? {
    let userDefault = UserDefaults.standard
    return userDefault.object(forKey: key)
  }
}

Facade.set("gogogo", for: "ck")
Facade.object(for: "ck")

