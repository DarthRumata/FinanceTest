//
//  WealthCalculationService.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/6/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation

final class WealthCalculatioService {

  private let calendar: Calendar

  init(calendar: Calendar) {
    self.calendar = calendar
  }

  func calculateTotalNetWorth(for assets: [FinanceAsset]) -> Double {
    return assets.reduce(0) { (result, asset) -> Double in
      return asset.currentValuation.valueInCurrency + result
    }
  }

  func calculateNetIncomeYTD(for assets: [FinanceAsset]) -> Double {
    return calculateTotalNetWorth(for: assets) - wealthAtTheBeginningOfYear(for: assets)
  }

  private func wealthAtTheBeginningOfYear(for assets: [FinanceAsset]) -> Double {
    return assets.reduce(0) { (result: Double, asset: FinanceAsset) -> Double in
      return result + wealthAtTheBeginningOfYear(for: asset)
    }
  }

  private func wealthAtTheBeginningOfYear(for asset: FinanceAsset) -> Double {
    if asset.history.isEmpty {
      return 0
    }

    let currentYear = calendar.component(.year, from: Date())
    var result: AssetValuation!
    for valuation in asset.history {
      if calendar.component(.year, from: valuation.date) == currentYear {
        if result == nil {
          result = valuation
        }
        break
      } else {
        result = valuation
      }
    }

    return result.valueInCurrency
  }

}
