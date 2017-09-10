//: Playground - noun: a place where people can play

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
