//
//  WebView.swift
//  FoodPin
//
//  Created by 張俊傑 on 2022/7/15.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
