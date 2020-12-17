//
//  HomeView.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/17.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var cardViewInputs: [CardView.input] = []
    
    var body: some View {
        
        NavigationView {
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
