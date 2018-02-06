//
//  Asset.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/4/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Mapper

enum FinanceAssetType: String {
  case bankAccount = "BANK_ACCOUNT"
  case fixedIncome = "FIXED_INCOME"
  case commodities = "COMMODITIES"
  case publicFunds = "PUBLIC_FUNDS"
  case privateFunds = "PRIVATE_FUNDS"
  case equityQuoted = "EQUITY_QUOTED"
  case equityUnquoted = "EQUITY_UNQUOTED"
  case privateEquity = "PRIVATE_EQUITY"
  case investmentPortfolios = "INVESTMENT_PORTFOLIOS"
  case realEstate = "REAL_ESTATE"
  case artwork = "ARTWORK"
  case chattles = "CHATTLES"
  case marineAndAviation = "MARINE_AVIATION"
}

enum Currency: String {
  case GBP = "GBP"

  var symbol: String {
    switch self {
    case .GBP:
      return "£"
    }
  }
}

enum Category: String {
  case assetsWithinStructure = "ASSETS_WITHIN_STRUCTURE"
  case assetsOutsideStructure = "ASSETS_OUTSIDE_STRUCTURE"
  case fixedIncomeAssets = "FIXED_INCOME_ASSETS"
}

struct FinanceAsset: Mappable {

  let type: FinanceAssetType
  let assetDescription: String
  let currency: Currency
  let startingDate: Date
  let category: Category
  let currentValuation: AssetValuation
  let history: [AssetValuation]

  init(map: Mapper) throws {
    try type = map.from("assetType")
    try assetDescription = map.from("assetDescription")
    try currency = map.from("currency")
    try startingDate = map.from("startingDate")
    try category = map.from("category")
    try history = map.from("historicalValuations")
    try currentValuation = map.from("currentValuation")
  }

}
