//
//  CardPageView.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 17.09.22.
//

import SwiftUI

struct ListItem: Hashable {
        let question: String
        let answer: Bool
    }

struct CardPageView: View {
    @ObservedObject var cardManagerVM: CardManagerVM
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    
    var body: some View {
        NavigationView {
            ZStack {
                ForEach(CardManagerVM.cardData, id: \.self) { item in
                    Rectangle()
                        .frame(width: 320, height: 420)
                        .border(.white, width: 6.0)
                        .cornerRadius(4)
                        .foregroundColor(color.opacity(0.9))
                        .shadow(radius: 4)
                    HStack {
                        Text(item.question)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                    }
                }
            }
            .offset(x: offset.width * 1, y: offset.height * 0.4)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                        withAnimation {
                            changeColor(width: offset.width)
                        }
                    }
                    .onEnded { _ in
                        withAnimation {
                            swipeCard(width: offset.width)
                            changeColor(width: offset.width)
                        }
                    }
            )
            
        }
        
    }
    func swipeCard(width: CGFloat) {
          switch width {
          case -500...(-150):
              print("false")
              offset = CGSize(width: -500, height: 0)
          case 150...500:
              print("true")
              offset = CGSize(width: 500, height: 0)
          default:
              offset = .zero
          }
      }

    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .black
        }
    }
}



struct CardPageView_Previews: PreviewProvider {
    static var previews: some View {
        CardPageView(cardManagerVM: CardManagerVM())
    }
}
