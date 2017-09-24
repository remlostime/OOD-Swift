//: Playground - noun: a place where people can play

import Foundation

protocol Currency {
  func symbol() -> String
  func code() -> String
}

class US: Currency {
  func symbol() -> String {
    return "$"
  }

  func code() -> String {
    return "USD"
  }
}

class Euro: Currency {
  func symbol() -> String {
    return "€"
  }

  func code() -> String {
    return "EUR"
  }
}

class China: Currency {
  func symbol() -> String {
    return "¥"
  }

  func code() -> String {
    return "CNY"
  }
}

class ErrorCurrency: Currency {
  func symbol() -> String {
    return "Error symbol"
  }
  
  func code() -> String {
    return "Error code"
  }
}

enum Country {
  case USA
  case China
  case Euro
}

class CurrencyFactory {
  static func getCurrency(_ country: Country) -> Currency {
    switch country {
    case .USA:
      return US()
    case .China:
      return China()
    case .Euro:
      return Euro()
    }
  }
}

let currency = CurrencyFactory.getCurrency(.China)
currency.code()
currency.symbol()


// Reflection - Get class dynamiclly
func classFromString(_ className: String) -> Currency {
  
  guard let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
    return ErrorCurrency()
  }
  
  guard let cls = NSClassFromString("\(namespace).\(className)") as? Currency else {
    return ErrorCurrency()
  }
  
  return cls
}

let className = "US"
let currencyClass = classFromString(className)
currencyClass.code()
currencyClass.symbol()

