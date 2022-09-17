//
//  QuizCompletedView.swift
//  AKQuiz
//
//  Created by Rocha, Isabelly on 16.09.22.
//
import Foundation
import SwiftUI

struct QuizCompletedView: View {
    var gameManagerVM: GameManagerVM
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(Color.white)
                .font(.system(size: 60))
                .padding()
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus ?
                         "THAT'S A WRAP" :
                            "YOU MADE IT",
                         size: 30)
                .padding()
            
            ReusableText(text: gameManagerVM.model.quizWinningStatus
                         ? "Thank you for playing!!"
                         : "Better luck next time",
                         size: 30)
                .padding()
        
            Button {
                gameManagerVM.restartGame()
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .padding()
                    
                    Text("Play Again")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                }
            }.frame(width: 300, height: 60, alignment: .center)
                .background(.red)
                .cornerRadius(30)
                .padding()
            
            Spacer()
            
            Link("Tweet", destination: URL(string: "https://twitter.com/intent/tweet?text=Hey!%20I%20just%20learned%20about%20%23climatechange%20in%20%23Switzerland,%20come%20and%20join%20me%20in%20app%20%40quizerland%20to%20learn%20more!")!)
                               .padding(.all)
                               .frame(width: nil)
                               .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.11372549019607843, green: 0.6313725490196078, blue: 0.9490196078431372)/*@END_MENU_TOKEN@*/)
                               .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                               .cornerRadius(40)
                               .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                               .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
        }.background(Image("bg_completed").ignoresSafeArea(.all, edges: .all))
    }
}
