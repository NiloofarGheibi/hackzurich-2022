//
//  HomePageView.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 16.09.22.
//

import SwiftUI

struct HomePageView: View {
    @State var navigated = false
    var body: some View {
        NavigationStack {
            ZStack {
                VStack (spacing: 0) {
                    VStack (spacing: 80){
                        Button(action: singlePlayer, label: {
                            NavigationLink(destination: CardContentView(gameManagerVM: CardManagerVM())){
                                Text("Flash Cards")
                                    .padding()
                                    .frame(width:300, height: 90)
                                    .background(.red.opacity(0.7))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .cornerRadius(15)
                            }})
                        
                        Button(action: singlePlayer, label: {
                            NavigationLink(destination: MultiPageView(gameManagerVM: GameManagerVM())){
                                Text("Multiple Choice")
                                    .padding()
                                    .font(.system(size: 20))
                                    .frame(width:300, height: 90)
                                    .background(.red.opacity(0.7))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                            }})
                        
                        
                        Button(action: singlePlayer, label: {
                            NavigationLink(destination: GuessView()){
                                Text("Guess Game")
                                    .padding()
                                    .font(.system(size: 20))
                                    .frame(width: 300, height: 90)
                                    .background(.red.opacity(0.7))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                            }})
                    }
                }
            }.background(Image("bg_home")
                .scaledToFill()
                .ignoresSafeArea(.all, edges: .all))
        }
    }
}

func singlePlayer() {

}
func multiPlayer() {

}
func betting() {
    
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
