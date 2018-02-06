//
//  InfrastructureServicesAssembly.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

struct InfrastructureServicesAssembly: Assembly {

  func assemble(container: Container) {
    container.autoregister(FileService.self, initializer: FileService.init).inObjectScope(.container)
    container.autoregister(JSONParseService.self, initializer: JSONParseService.init).inObjectScope(.container)
    container.autoregister(Calendar.self) {
      return Calendar(identifier: Calendar.Identifier.gregorian)
    }.inObjectScope(.container)
  }

}
