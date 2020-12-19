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
    @Published var isLording = false
    @Published var isShoeSheet = false
    @Published var repositoryUrl: String = ""
    
    
}
