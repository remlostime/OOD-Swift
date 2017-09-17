//: Playground - noun: a place where people can play

class NameCard {
  var name: String?
  let font: String

  init(_ font: String) {
    self.font = font
  }

  func clone() -> NameCard {
    return NameCard(font)
  }
}

let kai = NameCard("KaiShu")
kai.name = "Kai Chen"

let lifan = kai.clone()
lifan.name = "Lifan Zhang"

let gujie = kai.clone()
gujie.name = "Jie Gu"
