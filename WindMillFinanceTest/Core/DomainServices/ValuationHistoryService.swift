//
//  ValuationHistoryService.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/6/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation

struct AggregatedHistory {
  let values: [Double]
  let dateLabels: [Date]
}

final class ValuationHistoryService {

  fileprivate let calendar: Calendar

  private var quarterBeginningDate: Date {
    return calendar.startOfDay(for: calendar.date(byAdding: .month, value: -3, to: Date())!)
  }

  private var periodsCount: Int {
    return calendar.dateComponents([.day], from: quarterBeginningDate, to: Date()).day!
  }

  init(calendar: Calendar) {
    self.calendar = calendar
  }

  func calculateQuarterHistory(for assets: [FinanceAsset]) -> AggregatedHistory {
    var aggregatedHistory: [Double] = []
    for index in 0..<periodsCount {
      let periodSum = assets.reduce(0) { (result, asset) -> Double in
        let assetHistory = calculateQuarterHistory(for: asset)
        return assetHistory[index] + result
      }
      aggregatedHistory.append(periodSum)
    }

    var labels: [Date] = []
    let currentDate = Date()
    for index in 0...2 {
      let monthLabel = calendar.date(byAdding: .month, value: -index, to: currentDate)!
      labels.append(monthLabel)
    }
    return AggregatedHistory(values: aggregatedHistory, dateLabels: labels)
  }

  private func calculateQuarterHistory(for asset: FinanceAsset) -> [Double] {
    let quarterBeginningDate = self.quarterBeginningDate

    var quarterValuations: [AssetValuation] = []
    var amountBeforeQuarter: Double = 0
    for valuation in asset.history {
      if valuation.date.compare(quarterBeginningDate) != .orderedAscending {
        quarterValuations.append(valuation)
      } else {
        amountBeforeQuarter = valuation.valueInCurrency
      }
    }

    var aggregatedPeriods: [Double] = Array(repeating: amountBeforeQuarter, count: periodsCount)

    for valuationIndex in 0..<quarterValuations.count {
      let valuation = quarterValuations[valuationIndex]
      let dayIndex = calendar.dateComponents([.day], from: quarterBeginningDate, to: valuation.date).day!
      aggregatedPeriods[dayIndex] = valuation.valueInCurrency
      if valuationIndex == quarterValuations.count - 1 {
        let lastRange: Range<Int> = Range(dayIndex..<aggregatedPeriods.count)

        aggregatedPeriods.replaceSubrange(
          lastRange,
          with: Array(repeating: valuation.valueInCurrency, count: lastRange.count)
        )
      }
    }

    return aggregatedPeriods
  }

}
