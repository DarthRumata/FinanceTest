//
//  DomainServicesAssembly.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

struct DomainServicesAssembly: Assembly {

  func assemble(container: Container) {
    container.autoregister(ValuationHistoryService.self, initializer: ValuationHistoryService.init)
    container.autoregister(WealthCalculatioService.self, initializer: WealthCalculatioService.init)
  }
}
