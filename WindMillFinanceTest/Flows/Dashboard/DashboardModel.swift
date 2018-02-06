//
//  DashboardModel.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/4/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation

protocol DashboardModelInterface: class {

  func handle(signal: DashboardSignal)

  var displayableInfo: Dashboard.DispalyableInfo { get }

}

class DashboardModel {

  var controller: DashboardControllerInterface!

  // MARK: Dependancies
  fileprivate let userRepository: UserJSONRepository
  fileprivate let historyService: ValuationHistoryService
  fileprivate let wealthService: WealthCalculatioService

  // MARK: Data
  fileprivate var user: User!

  init(userRepository: UserJSONRepository, historyService: ValuationHistoryService, wealthService: WealthCalculatioService) {
    self.userRepository = userRepository
    self.historyService = historyService
    self.wealthService = wealthService
  }
  
}

extension DashboardModel: DashboardModelInterface {

  func handle(signal: DashboardSignal) {
    switch signal {
    case .viewLoaded:
      loadUser()
    }
  }

  var displayableInfo: Dashboard.DispalyableInfo {
    guard let user = user else {
      return Dashboard.DispalyableInfo(
        netWorth: 0,
        netIncome: 0,
        currency: .GBP,
        valuationHistory: [],
        dateLabels: []
      )
    }
    let history = historyService.calculateQuarterHistory(for: user.assets)
    return Dashboard.DispalyableInfo(
      netWorth: wealthService.calculateTotalNetWorth(for: user.assets),
      netIncome: wealthService.calculateNetIncomeYTD(for: user.assets),
      currency: .GBP, // I don't know where to take correct currency(if it's possible)
      valuationHistory: history.values,
      dateLabels: history.dateLabels
    )
  }

}

private extension DashboardModel {

  func loadUser() {
    userRepository.getUser().then { (user) in
      self.setUserAndReload(user: user)
      }.catch { (error) in
        // Not implemented error presenting in controller(demo)
        print(error)
    }
  }

  func setUserAndReload(user: User) {
    self.user = user
    // Model is main actor according to my vision
    controller.reloadData()
  }

}
