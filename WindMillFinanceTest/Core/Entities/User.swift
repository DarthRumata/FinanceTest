//
//  User.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/4/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Mapper

struct User: Mappable {

  let id: String
  let name: String
  let assets: [FinanceAsset]

  init(map: Mapper) throws {
    try id = map.from("_id")
    try name = map.from("clientName")
    try assets = map.from("assets")
  }
  
}
