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

}

class DashboardModel {

  var controller: DashboardControllerInterface!

  fileprivate let userRepository: UserJSONRepository
  fileprivate var user: User?

  init(userRepository: UserJSONRepository) {
    self.userRepository = userRepository


  }
  
}

extension DashboardModel: DashboardModelInterface {

  func handle(signal: DashboardSignal) {
    switch signal {
    case .viewLoaded:
      loadUser()

    }
  }

}

private extension DashboardModel {

  func loadUser() {
    userRepository.getUser().then { (user) in
      self.user = user
      }.catch { (error) in
        print(error)
    }
  }

}
