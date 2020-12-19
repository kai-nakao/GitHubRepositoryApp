//
//  HomeView.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/17.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    @State private var cardViewInputs: [CardView.input] = []
    
    var body: some View {
        
        NavigationView {
            if viewModel.isLoading {
                Text("読込中...")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .offset(x: 0, y: -200)
                    .navigationBarTitle("", displayMode: .inline)
            }
            ScrollView(showsIndicators: false) {
                ForEach(cardViewInputs) { input in
                    Button(action: {
                    }) {
                        CardView(input: input)
                    }
                }
                
            }
            
            .padding()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: HStack {
                TextField("検索キーワードを入力", text: $text, oncommit: {
                    viewModel.apply(inputs: .oncommit(text: text))
                })
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keybordType(.asciiCapable)
                    .frame(width: UIScreen.main.bounds.width - 40)
            })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
