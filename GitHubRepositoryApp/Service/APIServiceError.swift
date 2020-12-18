//
//  APIServiceError.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/18.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import Foundation

enum APIServiceError: Error {
    case invalidURL
    case responseError
    case parseError(Error)
}
