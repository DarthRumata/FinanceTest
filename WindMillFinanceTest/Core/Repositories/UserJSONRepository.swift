//
//  UserJSONRepository.swift
//  WindMillFinanceTest
//
//  Created by Rumata on 2/5/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import PromiseKit

private let userFilename = "ngpo"

final class UserJSONRepository {

  private let fileService: FileService
  private let parseService: JSONParseService

  init(fileService: FileService, parseService: JSONParseService) {
    self.fileService = fileService
    self.parseService = parseService
  }

  func getUser() -> Promise<User> {
    return Promise { fulfill, reject in
      do {
        let data = try fileService.readTextFileInBundle(withName: userFilename, fileType: .json)
        let users: [User] = try parseService.parse(data: data)
        fulfill(users[0])
      } catch (let error) {
        reject(error)
      }
    }
  }

}
