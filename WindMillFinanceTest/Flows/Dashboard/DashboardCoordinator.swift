//
//  DashboardCoordinator.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/4/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import EventsTree
import Swinject
import SwinjectAutoregistration

final class DashboardCoordinator: EventNode, FlowCoordinator {

  fileprivate let resolver: Resolver

  init(parent: EventNode?, resolver: Resolver) {
    self.resolver = resolver

    super.init(parent: parent)
  }

  func makeFlow() -> UIViewController {
    let controller: DashboardController = resolver~>

    return UINavigationController(rootViewController: controller)
  }

}
