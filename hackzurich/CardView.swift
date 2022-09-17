//
//  CardView.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 17.09.22.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: LikeDislike = .none
    @State private var color: Color = .white
    private var card: CardQuestion
    private var onRemove: (_ user: CardQuestion) -> Void
    
    private var thresholdPercentage: CGFloat = 0.3
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
    init(card: CardQuestion, onRemove: @escaping (_ user: CardQuestion) -> Void) {
        self.card = card
        self.onRemove = onRemove
    }
    
    /// What percentage of our own width have we swipped
    /// - Parameters:
    ///   - geometry: The geometry
    ///   - gesture: The current gesture translation value
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                ZStack(alignment: self.swipeStatus == .like ? .topLeading : .topTrailing) {
                    if self.swipeStatus == .like {
                        Rectangle()
                            .frame(width: 380, height: 420)
                            .foregroundColor(.green)
                    } else if self.swipeStatus == .dislike {
                        Rectangle()
                            .frame(width: 380, height: 420)
                            .foregroundColor(.red)
                    }
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("\(self.card.question)")
                                .font(.title)
                                .bold()
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .padding(.leading)
                .frame(width: 360, height: 420)
                .background(Image("\(self.card.image)").ignoresSafeArea(.all, edges: .all))
                .cornerRadius(10)
                .shadow(radius: 5)
                .offset(x: self.translation.width, y: 0)
                .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                print("animation")
                            }
                            self.translation = value.translation
                            if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                                self.swipeStatus = .like
                            } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                                self.swipeStatus = .dislike
                            } else {
                                self.swipeStatus = .none
                            }
                            
                        }.onEnded { value in
                            withAnimation(.spring()) {
                                print("animation")
                            }
                            // determine snap distance > 0.5 aka half the width of the screen
                            if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                                self.onRemove(self.card)
                            } else {
                                self.translation = .zero
                            }
                        }
                )
            }
            
        }
    }
    
    struct CardView_Previews: PreviewProvider {
        static var previews: some View {
            CardView(card: CardQuestion(id: 1, image: "bg_share", question: "Mark", answer: true),
                     onRemove: { _ in
                // do nothing
            })
            .frame(height: 400)
            .padding()
        }
    }
}
