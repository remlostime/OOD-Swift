//: Playground - noun: a place where people can play

protocol Computer {
  func hack()
}

class M87: Computer {
  func hack() {
    print("Hack it, haha")
  }
}

class SuperComputer: Computer {
  private var computer: M87?

  func auth(_ password: String) -> Bool {
    guard password == "123456" else {
      return false
    }

    computer = M87()

    return true
  }

  func hack() {
    computer?.hack()
  }
}

let superComputer = SuperComputer()
superComputer.auth("123456")
superComputer.hack()
