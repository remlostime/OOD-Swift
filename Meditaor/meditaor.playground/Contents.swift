//: Playground - noun: a place where people can play

protocol Receiver {
  associatedtype MessageType
  func receive(message: MessageType)
}

protocol Sender {
  associatedtype ReceiverType
  associatedtype MessageType
  
  var receivers: [ReceiverType] { get }
  func send(_ message: MessageType)
}

class Programmer: Receiver {
  let name: String
  
  init(_ name: String) {
    self.name = name
  }
  
  func receive(message: String) {
    print("\(name) receive: \(message)")
  }
}

class Meditaor: Sender {
  
  var receivers: [Programmer]
  
  init(_ receivers: [Programmer]) {
    self.receivers = receivers
  }
  
  func send(_ message: String) {
    receivers.forEach { programmer in
      programmer.receive(message: message)
    }
  }
}

let p1 = Programmer("Kai")
let p2 = Programmer("Lifan")
let meditaor = Meditaor([p1, p2])
meditaor.send("gogogo")

