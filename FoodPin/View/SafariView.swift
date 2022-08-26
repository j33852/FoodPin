//
//  SafariView.swift
//  FoodPin
//
//  Created by 張俊傑 on 2022/7/15.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable{
    
    var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}
