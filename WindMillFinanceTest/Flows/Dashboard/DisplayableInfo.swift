//
//  DisplayableInfo.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation

enum Dashboard {
  struct DispalyableInfo {
    let netWorth: Double
    let netIncome: Double
    let currency: Currency
    let valuationHistory: [Double]
    let dateLabels: [Date]
  }
}

