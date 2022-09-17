//
//  GuessView.swift
//  hackzurich
//
//  Created by Rocha, Isabelly on 17.09.22.
//

import SwiftUI

struct GuessView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                            
                ReusableText(text: "What is the typical level of energy consumption in a four-person household?", size: 25)
                    .lineLimit(3)
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 90, alignment: .center)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                GuessSlider()
                    .padding()
                    
                Spacer()
                
                Button(action: betting, label: {
                    NavigationLink(destination: LeaderPageView()) {
                        Text("Submit Guess!")
                    }
                            .padding()
                            .frame(width:300)
                            .font(.system(size: 14))
                            .cornerRadius(10)
                            .background(Color.white)
                            .foregroundColor(Color.black)
                    })
                
                Spacer()
            }
        }
    }
}

struct GuessView_Previews: PreviewProvider {
    static var previews: some View {
        GuessView()
    }
}
