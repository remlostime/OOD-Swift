//: Playground - noun: a place where people can play

protocol Computer {
  func hack()
}

class M87: Computer {
  func hack() {
    print("haha, gogogo")
  }
}

class M87Proxy: Computer {
  private let m87 = M87()

  func hack() {
    m87.hack()
  }
}

let m87Proxy = M87Proxy()
m87Proxy.hack()