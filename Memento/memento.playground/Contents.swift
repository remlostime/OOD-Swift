//: Playground - noun: a place where people can play

import Foundation

typealias Memento = NSDictionary

protocol MementoState {
  var memento: Memento { get }
  init?(_ memento: Memento?)
}

struct Game: MementoState {
  private let key1 = "key1"
  private let key2 = "key2"
  
  var val1: String
  var val2: String
  
  var memento: Memento {
    return [key1: val1, key2: val2]
  }
  
  init(val1: String, val2: String) {
    self.val1 = val1
    self.val2 = val2
  }
  
  init?(_ memento: Memento?) {
    guard
      let memento = memento,
      let val1 = memento[key1] as? String,
      let val2 = memento[key2] as? String else {
        return nil
    }
    
    self.val1 = val1
    self.val2 = val2
  }
}

class MementoManager {
  static func save(_ mementoState: MementoState, for key: String) {
    let userDefaults = UserDefaults.standard
    userDefaults.set(mementoState.memento, forKey: key)
    userDefaults.synchronize()
  }
  
  static func get(key: String) -> Memento? {
    let userDefaults = UserDefaults.standard
    guard let memento = userDefaults.object(forKey: key) as? Memento else {
      return nil
    }
    
    return memento
  }
}

var game = Game(val1: "111", val2: "222")

MementoManager.save(game, for: "begin")

game.val1 = "333"
game.val2 = "444"

MementoManager.save(game, for: "mid")

game.val1 = "555"
game.val2 = "666"

MementoManager.save(game, for: "end")

if let memeto = MementoManager.get(key: "mid") {
  let midGame = Game(memeto)
  dump(midGame)
}

