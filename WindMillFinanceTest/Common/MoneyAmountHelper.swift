//
//  MoneyAmountHelper.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation

enum MoneyScale: String {
  case billion = "b"
  case million = "m"
  case thousand = "k"
}

struct MoneyShortForm {
  let amount: Float
  let scale: MoneyScale?
}

private let thousand: Double = 1000
private let million: Double = 1000000
private let billion: Double = 1000000000

enum MoneyAmountHelper {

  static func convertToShortForm(value: Double) -> MoneyShortForm {
    if value < thousand {
      return MoneyShortForm(amount: Float(value), scale: nil)
    } else if value < million {
      return MoneyShortForm(amount: Float(value / thousand), scale: .thousand)
    } else if value < billion {
      return MoneyShortForm(amount: Float(value / million), scale: .million)
    } else {
      return MoneyShortForm(amount: Float(value / billion), scale: .billion)
    }
  }

  static func roundValue(_ value: Float, fractialPartLength: Int) -> Float {
    let divider: Float = pow(Float(10), Float(fractialPartLength))

    return round(value * divider) / divider
  }

}
