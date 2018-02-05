//
//  AppDelegate.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/3/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import UIKit
import EventsTree
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  private let rootNode = EventNode(parent: nil)
  private var assembler: Assembler!
  private var applicationCoordinator: ApplicationCoordinator!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    assembler = AssemblerFactory.makeAssembler(with: rootNode)
    // Start application flow
    applicationCoordinator = ApplicationCoordinator(resolver: assembler.resolver)
    window = applicationCoordinator.makeInitialFlow()
    window!.makeKeyAndVisible()

    return true
  }

}

