//
//  ViewController.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/3/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import UIKit
import Reusable

protocol DashboardControllerInterface: class {

  func reloadData()

}

enum DashboardCellInfo: Int {
  case netWorth
  case performance

  static let count = 2

  var height: CGFloat {
    switch self {
    case .netWorth:
       return 90

    case .performance:
      return 298
    }
  }

}

private let sectionOffset: CGFloat = 12

class DashboardController: UIViewController {

  var model: DashboardModelInterface!

  @IBOutlet fileprivate weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()

    configureNavigationBar()
    configureCollectionView()

    model.handle(signal: .viewLoaded)
  }

}

extension DashboardController: DashboardControllerInterface {

  func reloadData() {
    collectionView.reloadData()
  }
  
}

extension DashboardController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return DashboardCellInfo.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellInfo = DashboardCellInfo(rawValue: indexPath.item)!
    switch cellInfo {
    case .netWorth:
      let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: NetWorthCell.self)
      cell.configure(
        netWorth: model.displayableInfo.netWorth,
        netIncome: model.displayableInfo.netIncome,
        currency: model.displayableInfo.currency
      )
      return cell

    case .performance:
      let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PerformanceCell.self)
     
      cell.configure(
        withPeriodValues: model.displayableInfo.valuationHistory,
        dateLabels: model.displayableInfo.dateLabels
      )
      
      return cell
    }
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellInfo = DashboardCellInfo(rawValue: indexPath.item)!
    return CGSize(width: collectionView.bounds.width, height: cellInfo.height)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: sectionOffset, left: 0, bottom: sectionOffset, right: 0)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionOffset
  }

}

private extension DashboardController {

  func configureNavigationBar() {
    navigationController!.navigationBar.titleTextAttributes = [
      NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18),
      NSAttributedStringKey.foregroundColor: ColorName.greyishBrown.color
    ]
  }

  func configureCollectionView() {
    collectionView.register(cellType: NetWorthCell.self)
    collectionView.register(cellType: PerformanceCell.self)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = ColorName.collectionBackground.color
  }

}

