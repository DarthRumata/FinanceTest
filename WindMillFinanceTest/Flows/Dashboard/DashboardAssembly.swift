//
//  DashboardAssembly.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/4/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import EventsTree

struct DashboardAssembly: Assembly {

  func assemble(container: Container) {
    container.autoregister(
      DashboardCoordinator.self,
      arguments: EventNode.self, Resolver.self,
      initializer: DashboardCoordinator.init
    )
    container.autoregister(DashboardModel.self, initializer: DashboardModel.init).initCompleted { (r, model) in
      model.controller = r ~> DashboardController.self
    }
    container.autoregister(DashboardController.self) { r in
      return StoryboardScene.Dashboard.dashboardController.instantiate()
      }.initCompleted { (r, controller) in
        controller.model = r ~> DashboardModel.self
    }
  }

}
