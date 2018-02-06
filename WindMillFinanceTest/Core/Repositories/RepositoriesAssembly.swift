//
//  RepositoriesAssembly.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

struct RepositoriesAssembly: Assembly {

  func assemble(container: Container) {
    container.autoregister(UserJSONRepository.self, initializer: UserJSONRepository.init)
  }

}
