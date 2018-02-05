//
//  Valuation.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/4/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Mapper

private let dateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
  return formatter
}()

struct AssetValuation: Mappable {

  let date: Date
  let valueInGBP: Double
  let valueInCurrency: Double

  init(map: Mapper) throws {
    try date = map.from("valuationDate")
    try valueInGBP = map.from("valuationInGBP")
    try valueInCurrency = map.from("valuationInCurrency")
  }

}

extension Date: Convertible {
  public static func fromMap(_ value: Any) throws -> Date {
    guard let dateString = value as? String else {
      throw MapperError.convertibleError(value: value, type: String.self)
    }

    guard let date = dateFormatter.date(from: dateString) else {
      throw MapperError.convertibleError(value: dateString, type: Date.self)
    }

    return date
  }
}
