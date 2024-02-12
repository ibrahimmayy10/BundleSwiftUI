//
//  DetailsViewModel.swift
//  BundleSwiftUI
//
//  Created by İbrahim Ay on 13.02.2024.
//

import Foundation
import SafariServices
import UIKit

class DetailsViewModel: ObservableObject {
    func goToDetailsNews(url: URL) {
        let vc = SFSafariViewController(url: url)
    }
}
