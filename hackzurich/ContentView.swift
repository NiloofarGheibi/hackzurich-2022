//
//  ContentView.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 13.09.22.
//

import SwiftUI

struct HomeView : View {
    var body: some View {
        NavigationView {
             HomePageView()
        }
    }
}

struct ProfileView : View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
                ProfilePageView()
            }
        }
    }
}

struct LeaderBoardView : View {
    var body: some View {
        NavigationView {
           LeaderPageView()
        }
    }
}

struct ContentView: View {
    init() {
            UITabBar.appearance().backgroundColor = UIColor.red
            UITabBar.appearance().isOpaque = false
            UITabBar.appearance().unselectedItemTintColor = UIColor.white
            UITabBar.appearance().tintColor = UIColor.black
    }
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            LeaderBoardView()
                .tabItem {
                    Image(systemName: "person.3.sequence")
                    Text("Leader Board")
                }
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
