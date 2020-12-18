//
//  Repository.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/17.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import Foundation

struct Repository: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let htmlUrl: String
    let owner: Owner
}


