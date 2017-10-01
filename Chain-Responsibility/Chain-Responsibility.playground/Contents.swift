//: Playground - noun: a place where people can play

class MoneyPile {
  private var value: Int
  private var number: Int
  var nextPile: MoneyPile?
  
  init(value: Int, number: Int, nextPile: MoneyPile? = nil) {
    self.value = value
    self.number = number
    self.nextPile = nextPile
  }
  
  func canWithdraw(_ money: Int) -> Bool {
    guard money > 0 else {
      if money == 0 {
        return true
      }
      
      return false
    }
    
    var wantMoney = money
    
    func canGetMoney(_ money: Int) -> Bool {
      return money >= value && number > 0
    }
    
    while canGetMoney(wantMoney) {
      wantMoney = wantMoney - value
      number = number - 1
    }
    
    if wantMoney == 0 {
      return true
    }
    
    guard let nextPile = nextPile else {
      return false
    }
    
    return nextPile.canWithdraw(wantMoney)
  }
}

class ATM {
  let startPile: MoneyPile?
  
  init(_ startPile: MoneyPile? = nil) {
    self.startPile = startPile
  }
  
  func canWithdraw(_ money: Int) -> Bool {
    guard let startPile = startPile else {
      return false
    }
    return startPile.canWithdraw(money)
  }
}

let one = MoneyPile(value: 1, number: 1)
let five = MoneyPile(value: 5, number: 5, nextPile: one)
let ten = MoneyPile(value: 10, number: 10, nextPile: five)
let twenty = MoneyPile(value: 20, number: 10, nextPile: ten)
let fifty = MoneyPile(value: 50, number: 3, nextPile: twenty)
let hundred = MoneyPile(value: 100, number: 10, nextPile: fifty)

let atm = ATM(hundred)

atm.canWithdraw(302)
