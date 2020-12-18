//
//  SearchRepositoryResponse.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/18.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import Foundation

struct SearchRepositoryResponse: Decodable {
    let items: [Repository]
}
