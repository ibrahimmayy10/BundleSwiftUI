//
//  NewsViewModel.swift
//  BundleSwiftUI
//
//  Created by İbrahim Ay on 12.02.2024.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles = [Articles]()
    
    func downloadNews(url: URL, completion: @escaping () -> Void) {
        Webservices.shared.downloadNews(url: url) { articles in
            if let articles = articles {
                self.articles = articles
            }
            completion()
        }
    }
}
