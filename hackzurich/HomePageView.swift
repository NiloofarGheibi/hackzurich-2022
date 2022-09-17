//
//  HomePageView.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 16.09.22.
//

import SwiftUI

struct HomePageView: View {
    @State private var showingSingleView = false
    @State private var showingMultiView = false
    @State private var showingGuessView = false

    var body: some View {
        NavigationView {
            ZStack {
                VStack (spacing: 0) {
                    VStack (spacing: 80) {
                        Button(action: singlePlayer, label: {
                            NavigationLink(destination: CardContentView(gameManagerVM: CardManagerVM()), isActive: $showingSingleView){
                                Text("Flash Cards")
                                    .padding()
                                    .frame(width:300, height: 90)
                                    .background(.red.opacity(0.7))
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .cornerRadius(15)
                            }
                            .onTapGesture {
                                showingSingleView = true
                            }.onChange(of: showingSingleView) { newValue in
                                print(newValue) // Will change to false when back is pressed
                            }
                        })
                        
                        Button(action: multiPlayer, label: {
                            NavigationLink(destination: MultiPageView(gameManagerVM: GameManagerVM()), isActive: $showingMultiView){
                                Text("Multiple Choice")
                                    .padding()
                                    .font(.system(size: 20))
                                    .frame(width:300, height: 90)
                                    .background(.red.opacity(0.7))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                            }
                            .onTapGesture {
                                showingMultiView = true
                            }.onChange(of: showingMultiView) { newValue in
                                print(newValue) // Will change to false when back is pressed
                            }
                        })
                        
                        
                        Button(action: guessing, label: {
                            NavigationLink(destination: GuessView(), isActive: $showingGuessView){
                                Text("Guess Game")
                                    .padding()
                                    .font(.system(size: 20))
                                    .frame(width: 300, height: 90)
                                    .background(.red.opacity(0.7))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(15)
                            }
                            .onTapGesture {
                                showingGuessView = true
                            }.onChange(of: showingGuessView) { newValue in
                                print(newValue) // Will change to false when back is pressed
                            }
                        })
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
func guessing() {
    
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
