//
//  DetailsView.swift
//  BundleSwiftUI
//
//  Created by İbrahim Ay on 12.02.2024.
//

import SwiftUI
import URLImage
import SafariServices

struct DetailsView: View {
    
    var article: Articles?
    
    var body: some View {
        VStack {
            let imageUrl = URL(string: article?.urlToImage ?? "")
            if let imageUrl = imageUrl {
                URLImage(imageUrl) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 350)
                }
                .padding(.top, 0)
            }
            Text(article?.title ?? "")
                .padding(.top, 10)
            Text(article?.description ?? "")
                .padding(.top, 10)
            Button(action: {
                UIApplication.shared.windows.first?.rootViewController?.present(SFSafariViewController(url: URL(string: article?.url ?? "")!), animated: true)
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(.primary)
                    Text("Detaya git")
                        .foregroundStyle(.white)
                }
            })
            .padding(.top, 10)
            .frame(width: 100, height: 50)
            Spacer()
        }.padding(.all, 10)
    }
}

#Preview {
    DetailsView()
}
