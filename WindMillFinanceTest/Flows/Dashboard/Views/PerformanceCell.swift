//
//  PerformanceCell.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import UIKit
import Reusable
import SwiftChart

private let labelDateFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "MMM yyyy"

  return formatter
}()

class PerformanceCell: UICollectionViewCell, NibReusable {

  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var periodButton: UIButton!
  @IBOutlet private weak var chartView: Chart!

  override func awakeFromNib() {
    super.awakeFromNib()

    titleLabel.text = L10n.Performance.caption

    chartView.areaAlphaComponent = 0.34
    chartView.yLabelsOnRightSide = true
    chartView.axesColor = .clear
    chartView.gridColor = UIColor.black.withAlphaComponent(0.1)
    chartView.labelColor = ColorName.purplishGrey.color
    chartView.labelFont = FontFamily.SegoeUI.regular.font(size: 14)
  }

  func configure(withPeriodValues values: [Double], dateLabels: [Date]) {
    chartView.xLabels = (0..<dateLabels.count).map { index in return Double(index * 30) }
    chartView.xLabelsFormatter = { index, value in
      return labelDateFormatter.string(from: dateLabels[index])
    }
    let series = ChartSeries(values)
    series.area = true
    series.color = ColorName.darkishPink.color
    chartView.add(series)
  }


  @IBAction func choosePeriod(_ sender: Any) {
    // Not implemented in demo
  }
}
