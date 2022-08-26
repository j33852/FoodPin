//
//  AboutView.swift
//  FoodPin
//
//  Created by 張俊傑 on 2022/7/15.
//

import SwiftUI

struct AboutView: View {
    
    /*
     連接網頁的三種方法
     1. Mobile Safari - iOS SDK 提供了 API，可以在行動版的 Safari 瀏覽器來開啟指定的 URL。在這種情況下，你的使用者只是暫時離開應用程式然後切換至 Safari。
     2. WKWebView - 這個視圖可以將網頁嵌入你的 App 中。可以將 UIWebView 想成是一 個精簡版的 Safari，它負責載入一個 URL 請求來顯示網頁內容。 WKWebView 具備 Nitro JavaScript 引擎的優點並且提供更多的功能。 當你需要顯示一個特定的網頁， WKWebView 是最好的選擇。
     3. SFSafariViewController - 這是在 iOS 9 所導入的控制器。雖然 WKWebView 可以讓 你在 App 中嵌入網頁內容，你必須建立一個自訂的網頁視圖才能提供完整的網頁瀏覽 功能。舉例而言， WKWebView 沒有內建 Back / Forward 按鈕，以讓使用者可以返回以 及往前瀏覽歷史記錄。為了提供這個功能，你必須使用 WKWebView 開發一個自訂的網 頁瀏覽器。在 iOS 9 中，Apple 導入 SFSafariViewController 來省下開發者自己建立瀏 覽器的工夫。透過 SFSafariViewController 的使用，你的使用者可以使用所有 Mobile Safari 的功能，且不需要離開你的App。
     */
    
    //加入.sheet會出現錯誤訊息, 要求WebLink型別應該要遵循Identifiable協定
    enum WebLink: String, Identifiable {
        case rateUs = "https://www.apple.com/ios/app-store"
        case feedback = "https://www.appcoda.com/contact"
        case twitter = "https://www.twitter.com/appcodamobile"
        case facebook = "https://www.facebook.com/appcodamobile"
        case instagram = "https://www.instagram.com/appcodadotcom"
        
        var id: UUID{
            UUID()
        }
    }
    
    //加入此狀態變數儲存目前的連結
    @State private var link: WebLink?
    
    var body: some View {
        NavigationView {
            List{
                Image("about")
                    .resizable()
                    .scaledToFit()
                
                Section{
                    //Link可直接連結到URL
                    Link(destination: URL(string: WebLink.rateUs.rawValue)!, label: {
                        Label("去App Store投票吧", image: "store")
                            .foregroundColor(.primary)
                    })
                    
                    //WKWebView及SFSafariViewController由於SwiftUI尚未提供
                    //得利用UIKit框架並使用UIViewRepresentable來建立視圖
                    Label("提供我們您寶貴的意見", image: "chat")
                        .onTapGesture {
                            link = .feedback
                        }
                }
                
                Section{
                    Label("Twitter", image: "twitter")
                        .onTapGesture {
                            link = .twitter
                        }
                    
                    Label("Facebook", image: "facebook")
                        .onTapGesture {
                            link = .facebook
                        }
                    
                    Label("Instagram", image: "instagram")
                        .onTapGesture {
                            link = .instagram
                        }
                }
            }
            .sheet(item: $link) { item in
                if let url = URL(string: item.rawValue){
//                    WebView(url: url)
                    //Safari視圖建立了返回與往前的按鈕
                    SafariView(url: url)
                }
            }
            
            .listStyle(GroupedListStyle())
            
            .navigationTitle("About")
            .navigationViewStyle(.automatic)
            
            
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
