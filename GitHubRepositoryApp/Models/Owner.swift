//
//  Owner.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/18.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import Foundation

struct Owner: Decodable, Hashable, Identifiable {
    let id: Int
    let avatarUrl: String
}

