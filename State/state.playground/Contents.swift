//: Playground - noun: a place where people can play

class Context {
  private var state: State
  
  init(_ state: State = UnauthState()) {
    self.state = state
  }
  
  var isAuth: Bool {
    get {
      return state.isAuth(self)
    }
  }
  
  var userId: String? {
    get {
      return state.userId(self)
    }
  }
  
  func changeStateToAuth(_ userId: String) {
    state = AuthState(userId)
  }
  
  func changeStateToUnauth() {
    state = UnauthState()
  }
}

protocol State {
  func isAuth(_ context: Context) -> Bool
  func userId(_ context: Context) -> String?
}

class AuthState: State {
  let userId: String?
  
  init(_ userId: String) {
    self.userId = userId
  }
  
  func isAuth(_ context: Context) -> Bool {
    return true
  }
  
  func userId(_ context: Context) -> String? {
    return userId
  }
}

class UnauthState: State {
  func isAuth(_ context: Context) -> Bool {
    return false
  }
  
  func userId(_ context: Context) -> String? {
    return nil
  }
}

let context = Context()
context.isAuth
context.userId
context.changeStateToAuth("111")
context.isAuth
context.userId
