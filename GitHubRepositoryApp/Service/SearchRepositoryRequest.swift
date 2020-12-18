//
//  SearchRepositoryRequest.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/18.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import Foundation

struct SearchRepositoryRequest: APIRequestType {
    typealias Response = SearchRepositoryResponse
    
    
    var path: String { return "/search/repositories" }
    var queryItems: [URLQueryItem]? {
        return [
            .init(name: "q", value: query),
            .init(name: "order", value: "desc")]
    }
    
    private let query: String
    init(query: String) {
        self.query = query
    }
}
