//: Playground - noun: a place where people can play

protocol Shape {
  func draw()
}

class Rect: Shape {
  func draw() {
    print("Rect")
  }
}

class Circle: Shape {
  func draw() {
    print("Circle")
  }
}

class WhiteBoard {
  let shapes: [Shape]
  
  init() {
    let rect = Rect()
    let circle = Circle()
    shapes = [rect, circle]
  }
  
  func draw() {
    shapes.forEach { shape in
      shape.draw()
    }
  }
}

let whiteBoard = WhiteBoard()
whiteBoard.draw()
