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
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    
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
        let responseSubscriber = onCommitSubject
            .flatMap { [apiService] (query) in
                apiService.request(with: SearchRepositoryRequest(query: query))
                    .catch { [weak self] error -> Empty<SearchRepositoryResponse, Never> in
                    self?.errorSubject.send(error)
                    return .init()
                }
        }
        .map{ $0.items }
        .sink(receiveValue: { [weak self] (repositories) in
        guard let self = self else { return }
            self.cardViewInputs = self.convertInput(repositories: repositories)
            self.inputText = ""
            self.isLoading = false
        })
        
        let loadingStartSubscriber = onCommitSubject
            .map { _ in true }
            .assign(to: \.isLoading, on: self)
    }
    
    private 
}
