//
//  MainView.swift
//  Marvel Heros
//
//  Created by Sphelele Ngubane on 2021/05/08.
//

import SwiftUI

struct MainView : View {
    
    init() {
        UIToolbar.appearance().barTintColor = UIColor.green
    }
    
    @StateObject var mainViewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            TabView {
                CharacterListView()
                    .tabItem {
                        Image(systemName: "person.3.fill")
                        Text ("Characters")
                    }
                    .environmentObject(self.mainViewModel)
                    .preferredColorScheme(self.mainViewModel.isDarkMode ? .dark : .light)

                ComicListView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text ("Comics")
                    }
                    .environmentObject(self.mainViewModel)
                    .preferredColorScheme(self.mainViewModel.isDarkMode ? .dark : .light)
            }.navigationTitle("Marvel Heros")
            .accentColor(.green)
            .toolbar(content: {
            ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Button {
                    if(mainViewModel.isDarkMode){
                        mainViewModel.isDarkMode = false
                        return
                    }
                    mainViewModel.isDarkMode = true
                } label: {
                    Label("Mode", systemImage: "smallcircle.fill.circle")
                        .foregroundColor(.green)
                        .accentColor(.green)
                        .colorMultiply(.green)
                        .labelStyle(IconOnlyLabelStyle())
                }.accentColor(.green)
                .foregroundColor(.green)
                }
            }).accentColor(.green)
        } //END NAV_VIEW
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
