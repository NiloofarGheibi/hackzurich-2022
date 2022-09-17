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
                Color.red
               
                VStack (spacing: 0) {
                    VStack (spacing: 60){
                        Button(action: singlePlayer, label: {
                            NavigationLink(destination: CardContentView(gameManagerVM: CardManagerVM())) {
                                Text("Flash Cards")
                            }
                                    .padding()
                                    .frame(width:300)
                                    .font(.system(size: 14))
                                    .cornerRadius(10)
                                    .background(Color.white)
                                    .foregroundColor(Color.black)
                            })
                        
                        Button(action: multiPlayer, label: {
                            NavigationLink(destination: MultiPageView(gameManagerVM: GameManagerVM())) {
                                Text("Multiple-Choice Quizz")
                            }
                                    .padding()
                                    .frame(width:300)
                                    .font(.system(size: 14))
                                    .cornerRadius(10)
                                    .background(Color.white)
                                    .foregroundColor(Color.black)
                            })
                        
                        Button(action: betting, label: {
                            NavigationLink(destination: GuessView()) {
                                Text("Take a Guess")
                            }
                                    .padding()
                                    .frame(width:300)
                                    .font(.system(size: 14))
                                    .cornerRadius(10)
                                    .background(Color.white)
                                    .foregroundColor(Color.black)
                            })
                    }
                }
            }
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
