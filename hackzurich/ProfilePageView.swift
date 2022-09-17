//
//  ProfileView.swift
//  hackzurich
//
//  Created by Rocha, Isabelly on 17.09.22.
//

import SwiftUI

struct ProfilePageView: View {
    var body: some View {
        NavigationView {

            Home()
                //.preferredColorScheme(.white)
                .navigationTitle("")
                .navigationBarHidden(true)
        }
    }
}

struct Home : View {
    @State var tab = "Marketplace"
    @Namespace var animation
    
    var body: some View {

        VStack {

            HStack {
                Button(action: {}) {
                    Image("menu")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    Image("bell")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack {
                Text("Dashboard")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 0) {
                TabButton(selected: $tab, title: "MarketPlace", animation: animation)
                TabButton(selected: $tab, title: "Donation", animation: animation)

            }
            .background(Color.white.opacity(0.08))
            .clipShape(Capsule())
            .padding(.horizontal)
            
            Spacer(minLength: 0)
            
        }
        .background(Image("bg_profile").ignoresSafeArea(.all, edges: .all))
        
    }
}

struct TabButton: View {
    @Binding var selected : String
    var title : String
    var animation : Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selected = title
            }
        }) {
            ZStack {
                Capsule()
                    .fill(Color.clear)
                    .frame(height: 45)
                
                if selected == title {
                    Capsule()
                        .fill(Color.white)
                        .frame(height: 45)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                }
                
                Text(title)
                    .foregroundColor(selected == title ? .black : .white)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
