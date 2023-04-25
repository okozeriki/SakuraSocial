//
//  MainTabView.swift
//  SakuraSocial
//
//  Created by 本村力希 on 2023/04/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        NavigationView {
            TabView{
                MapSearchView()
                    .tabItem({
                        Image(systemName: "mappin.and.ellipse")
                        Text("探す")
                    })
                
                UploadView()
                    .tabItem({
                        Image(systemName: "plus.square")
                        Text("投稿")
                    })
                
                TimelineSearchView()
                    .tabItem({
                        Image(systemName: "clock")
                        Text("タイムライン")
                    })
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .accentColor(.pink)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
