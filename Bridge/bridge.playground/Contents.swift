//: Playground - noun: a place where people can play

protocol Switch {
  func turnOn()
}

protocol Application {
  func run()
}

class Remote: Switch {
  private let app: Application
  
  init(_ app: Application) {
    self.app = app
  }
  func turnOn() {
    app.run()
  }
}

class Google: Application {
  func run() {
    print("hello, Google")
  }
}

class Apple: Application {
  func run() {
    print("hi, Siri")
  }
}

let google = Google()
let apple = Apple()
let remoteGoogle = Remote(google)
remoteGoogle.turnOn()
let removeApple = Remote(apple)
removeApple.turnOn()

