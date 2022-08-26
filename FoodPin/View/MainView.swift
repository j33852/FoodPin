//
//  MainView.swift
//  FoodPin
//
//  Created by 張俊傑 on 2022/7/15.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTabIndex = 0
    
    var body: some View {
        //使用TabView預設模式即可建立tabBar
        TabView(selection: $selectedTabIndex) {
            RestaurantListView()
                .tabItem {
                    Label("我的最愛", systemImage: "tag.fill")
                }
                .tag(0)
            
            Text("發現")
                .tabItem {
                    Label("發現", systemImage: "wand.and.rays")
                }
                .tag(1)
            
            AboutView()
                .tabItem {
                    Label("關於", systemImage: "square.stack")
                }
                .tag(2)
        }
        //調整標籤項目的顏色(預設為藍色)
        .accentColor(Color("NavigationBarTitle"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
