//
//  SafariView.swift
//  GitHubRepositoryApp
//
//  Created by 中尾開 on 2020/12/17.
//  Copyright © 2020 exaple.com. All rights reserved.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    var url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(
        _ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
