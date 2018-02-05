//
//  ViewController.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/3/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import UIKit

protocol DashboardControllerInterface: class {

}

class DashboardController: UIViewController {

  var model: DashboardModelInterface!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    navigationController!.navigationBar.titleTextAttributes = [
      NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18),
      NSAttributedStringKey.foregroundColor: ColorName.greyishBrown.color
    ]

    model.handle(signal: .viewLoaded)
  }

}

extension DashboardController: DashboardControllerInterface {
  
}

