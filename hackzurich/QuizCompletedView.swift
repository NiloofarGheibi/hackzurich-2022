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
            Spacer()
            
            Image("coin")
                .resizable()
                .frame(width: 90, height: 80)
                .foregroundColor(.white)
                .cornerRadius(50)

            ReusableText(text: "Congratulations!",
                         size: 30)
                .padding()
            
            ReusableText(text: "You have just earned " + String(Int.random(in: 0..<409)) + " Green Coins.",
                         size: 30)
                .frame(width:300)
                .padding()
    
            Spacer()
            
            Link(destination: URL(string: "https://twitter.com/intent/tweet?text=Hey!%20I%20just%20learned%20about%20%23climatechange%20in%20%23Switzerland,%20come%20and%20join%20me%20in%20app%20%40quizerland%20to%20learn%20more!")!) {
                Image("tweet").resizable().frame(width: 40, height: 40).cornerRadius(50)
                Text("Tweet").fontWeight(.bold)
            }
                               .padding(.all)
                               .frame(width: 200)
                               .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 0.11372549019607843, green: 0.6313725490196078, blue: 0.9490196078431372)/*@END_MENU_TOKEN@*/)
                               .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                               .cornerRadius(30)
                               .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                               .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
        }.background(Image("bg_completed").ignoresSafeArea(.all, edges: .all))
    }
}
