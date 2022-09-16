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
            ZStack {
                Color.red
            }
            .navigationTitle("Home")
        }
    }
}

struct ProfileView : View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
            }
            .navigationTitle("Profile")
        }
    }
}

struct LeaderBoardView : View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
            }
            .navigationTitle("Leader Board")
        }
    }
}

struct ContentView: View {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
