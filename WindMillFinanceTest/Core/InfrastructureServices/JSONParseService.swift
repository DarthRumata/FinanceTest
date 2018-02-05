//
//  JSONParseService.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Mapper

enum ParseError: Error {

  case invalidDataForObject
  case invalidDataForArray
  case impossibleToConstructObject

}

class JSONParseService {

  func parse<T: Mappable>(data: Data) throws -> T {
    guard let json = try JSONSerialization.jsonObject(with: data) as? NSDictionary else {
      throw ParseError.invalidDataForObject
    }

    guard let object = T.from(json) else {
      throw ParseError.impossibleToConstructObject
    }

    return object
  }

  func parse<T: Mappable>(data: Data) throws -> [T] {
    guard let json = try JSONSerialization.jsonObject(with: data) as? NSArray else {
      throw ParseError.invalidDataForArray
    }

    guard let objects = T.from(json) else {
      throw ParseError.impossibleToConstructObject
    }

    return objects
  }

}
