//
//  NetWorthCell.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import UIKit
import Reusable

class NetWorthCell: UICollectionViewCell, NibReusable {

  @IBOutlet private weak var totalNetWorthCaption: UILabel!
  @IBOutlet private weak var netIncomeCaption: UILabel!
  @IBOutlet private weak var totalNetWorthLabel: UILabel!
  @IBOutlet private weak var totalNetWorthNominalLabel: UILabel!
  @IBOutlet private weak var netIncomeIndicator: UIImageView!
  @IBOutlet private weak var netIncomeLabel: UILabel!
  @IBOutlet private weak var netIncomeNominal: UILabel!

  // It should be formatted strings in real project
  func configure(netWorth: Double, netIncome: Double, currency: Currency) {
    totalNetWorthCaption.text = L10n.NetWorth.caption
    netIncomeCaption.text = L10n.NetIncome.caption

    let totalNetWorth = MoneyAmountHelper.convertToShortForm(value: netWorth)
    let totalNetWorthValue = MoneyAmountHelper.roundValue(totalNetWorth.amount, fractialPartLength: 1)
    totalNetWorthLabel.text = "\(currency.symbol)\(totalNetWorthValue)"
    totalNetWorthNominalLabel.text = totalNetWorth.scale?.rawValue ?? ""

    let netIncome = MoneyAmountHelper.convertToShortForm(value: netIncome)
    let netIncomeValue = MoneyAmountHelper.roundValue(netIncome.amount, fractialPartLength: 1)
    netIncomeLabel.text = "\(abs(netIncomeValue))"
    netIncomeNominal.text = netIncome.scale?.rawValue ?? ""
    switch netIncome.amount {
    case 0:
      netIncomeIndicator.image = nil
      netIncomeLabel.textColor = .black

    case _ where netIncome.amount > 0:
      netIncomeIndicator.image = #imageLiteral(resourceName: "arrowUp")
      netIncomeLabel.textColor = ColorName.darkishGreen.color

    case _ where netIncome.amount < 0:
      netIncomeIndicator.image = #imageLiteral(resourceName: "ArrowDown")
      netIncomeLabel.textColor = ColorName.negativeIncomeColor.color

    default:
      break
    }
  }

}
