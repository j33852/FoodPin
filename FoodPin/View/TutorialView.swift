//
//  TutorialView.swift
//  FoodPin
//
//  Created by 張俊傑 on 2022/7/12.
//

import SwiftUI

struct TutorialView: View {
    let pageHeadings = ["建立你的美食地圖", "告訴你餐廳位置", "發現美好的餐廳"]
    let pageSubHeadings = ["紀錄你最愛的餐廳並創建屬於自己的美食地圖", "在地圖上搜尋及定位你最愛的餐廳", "發現你的朋友或其他美食家分享的餐廳"]
    let pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    
    //宣告一個狀態變數來追蹤目前頁面索引值
    @State private var currentPage = 0
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("hasViewedWalkthrough") var hasViewedWalkthrough = false
    
    //indexViewStyle修飾器指定頁面圓點, 但預設是白色的, 需靠UIKitAPI修改
    //用UIKitAPI修改頁面圓點顏色
    init(){
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
    
    var body: some View {
        VStack {
            //TabView可以直接左右滑動
            TabView(selection: $currentPage){
                ForEach(pageHeadings.indices, id: \.self){ index in
                    TutorialPage(image: pageImages[index], heading: pageHeadings[index], subHeading: pageSubHeadings[index])
                        //.tag提供每個頁面唯一的索引值
                        .tag(index)
                }
            }
            //欲將標準標籤視圖換成頁面滾動視圖, 只需要將標籤視圖的樣式設定為PageTabViewStyle
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .animation(.default, value: currentPage)
            
            VStack(spacing: 20){
                Button {
                    if currentPage < pageHeadings.count - 1{
                        currentPage += 1
                    } else {
                        hasViewedWalkthrough = true
                        dismiss()
                    }
                } label: {
                    Text(currentPage == pageHeadings.count - 1 ? "Get Started" : "Next")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 50)
                        .background(Color(.systemIndigo))
                        .cornerRadius(25)
                }
                
                if currentPage < pageHeadings.count - 1 {
                    Button {
                        hasViewedWalkthrough = true
                        dismiss()
                    } label: {
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(Color(.darkGray))
                    }

                }

            }
            .padding(.bottom)
        }
        
    }
}

struct TutorialPage: View{
    
    let image: String
    let heading: String
    let subHeading: String
    
    var body: some View{
        VStack(spacing: 70){
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10){
                Text(heading)
                    .font(.headline)
                
                Text(subHeading)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding(.top)
        
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
        
        TutorialPage(image: "onboarding-1", heading: "建立你的美食地圖", subHeading: "紀錄你最愛的餐廳並創建屬於自己的美食地圖")
    }
}
