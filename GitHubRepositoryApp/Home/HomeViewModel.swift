//
//  HomeViewModel.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/19.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    enum Inputs {
        case oncommit(text: String)
        case tappedCardView(urlString: String)
    }
    
    @Published private var cardViewInputs: [CardView.Input] = []
    @Published var inputText: String = ""
    @Published var isShowError = false
    @Published var isLoading = false
    @Published var isShowSheet = false
    @Published var repositoryUrl: String = ""
    
    private let apiService: APIServiceType
    private let onCommitSubject = PassthroughSubject<String, Never>()
    private let responseSubject = PassthroughSubject<SearchRepositoryResponse, Never>()
    
    init(apiService: APIServiceType) {
        self.apiService = apiService
        bind()
    }
    
    func apply(inputs: Inputs) {
        switch inputs {
        case .oncommit(let inputText): onCommitSubject.send(inputText)
        case .tappedCardView(let urlString):
            repositoryUrl = urlString
            isShowSheet = true
        }
    }
    
    private func bind() {
        
        let loadingStartSubscriber = onCommitSubject
            .map { _ in true }
            .assign(to: \.isLoading, on: self)
    }
}
