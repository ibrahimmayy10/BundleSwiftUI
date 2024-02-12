//
//  ContentView.swift
//  BundleSwiftUI
//
//  Created by İbrahim Ay on 12.02.2024.
//

import SwiftUI
import URLImage

struct MainView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    init() {
        self.viewModel = NewsViewModel()
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.articles, id: \.source.id) { articles in
                HStack {
                    let imageUrl = URL(string: articles.urlToImage ?? "")
                    if let imageUrl = imageUrl {
                        URLImage(imageUrl) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }.frame(width: 50, height: 100)
                    }
                    NavigationLink(destination: DetailsView(article: articles)) {
                        Text(articles.title)
                    }
                }
            }
        }.task {
            viewModel.downloadNews(url: URL(string: "https://newsapi.org/v2/top-headlines?country=US&apiKey=55bf61b34f6d4fb182bfdaf93a819d73")!, completion: {})
        }
    }
}

#Preview {
    MainView()
}
