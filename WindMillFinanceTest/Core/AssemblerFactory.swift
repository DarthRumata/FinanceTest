//
//  AssemblerFactory.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Swinject
import EventsTree

enum AssemblerFactory {

  static func makeAssembler(with rootNode: EventNode) -> Assembler {
    let rootContainer = Container()
    rootContainer.register(EventNode.self) { _ in
      return EventNode(parent: rootNode)
      }.inObjectScope(.transient)
    let assemblies: [Assembly] = [
      RepositoriesAssembly(),
      DomainServicesAssembly(),
      InfrastructureServicesAssembly(),
      DashboardAssembly()
    ]
    return Assembler(assemblies, container: rootContainer)
  }

}
