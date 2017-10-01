//: Playground - noun: a place where people can play

protocol Command {
  func execute()
}

class OpenCommand: Command {
  func execute() {
    print("Open \(door)")
  }
  
  init(_ door: String) {
    self.door = door
  }
  
  let door: String
}

class CloseCommand: Command {
  func execute() {
    print("Close \(door)")
  }
  
  init(_ door: String) {
    self.door = door
  }
  
  let door: String
}

class Door {
  let openCommand: OpenCommand
  let closeCommand: CloseCommand
  
  init(_ door: String) {
    openCommand = OpenCommand(door)
    closeCommand = CloseCommand(door)
  }
  
  func open() {
    openCommand.execute()
  }
  
  func close() {
    closeCommand.execute()
  }
}

let door = Door("Gogogo")
door.open()
door.close()
