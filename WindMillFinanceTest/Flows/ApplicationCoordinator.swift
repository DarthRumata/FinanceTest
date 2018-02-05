//
//  ApplicationCoordinator.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/3/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import EventsTree
import Swinject
import SwinjectAutoregistration

final class ApplicationCoordinator {

  fileprivate let resolver: Resolver
  fileprivate weak var window: UIWindow!

  init(resolver: Resolver) {
    self.resolver = resolver
  }

  func makeInitialFlow() -> UIWindow {
    let dashboardFlow = resolver.resolve(DashboardCoordinator.self, arguments: resolver~>EventNode.self, resolver)!
    let controller = dashboardFlow.makeFlow()

    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = controller

    self.window = window

    return window
  }

}
