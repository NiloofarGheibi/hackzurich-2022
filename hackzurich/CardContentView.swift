//
//  CardContentView.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 17.09.22.
//

import SwiftUI

struct CardQuestion: Hashable {
    var id: Int
    
    let question: String
    let answer: Bool
}

struct CardContentView: View {
    var gameManagerVM: CardManagerVM
    /// List of users
    @State var users: [CardQuestion] = [
        CardQuestion(id: 0, question: "Cindy", answer: true),
        CardQuestion(id: 1, question: "Mark", answer: false),
        CardQuestion(id: 2, question: "Clayton", answer: true),
        CardQuestion(id: 3, question: "Brittni",answer: false),
        CardQuestion(id: 4, question: "Archie", answer: true),
        CardQuestion(id: 5, question: "James", answer: true),
        CardQuestion(id: 6, question: "Danny", answer: false),
        CardQuestion(id: 7, question: "Chi",answer: true),
        CardQuestion(id: 8, question: "Josue",answer: false),
        CardQuestion(id: 9, question: "Debra", answer: true)
    ]
    
    /// Return the CardViews width for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardWidth(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        let offset: CGFloat = CGFloat(users.count - 1 - id) * 10
        return geometry.size.width - offset
    }
    
    /// Return the CardViews frame offset for the given offset in the array
    /// - Parameters:
    ///   - geometry: The geometry proxy of the parent
    ///   - id: The ID of the current user
    private func getCardOffset(_ geometry: GeometryProxy, id: Int) -> CGFloat {
        return  CGFloat(users.count - 1 - id) * 10
    }
    
    private var maxID: Int {
        return self.users.map { $0.id }.max() ?? 0
    }
    
    var body: some View {
        if (gameManagerVM.cards.cardCompleted) {
            QuizCompletedView(gameManagerVM: gameManagerVM)
        } else {
            VStack {
                GeometryReader { geometry in
                    LinearGradient(gradient: Gradient(colors: [Color.init(#colorLiteral(red: 0.8945180774, green: 0.04201600701, blue: 0.2176240385, alpha: 1)), Color.init(#colorLiteral(red: 1, green: 0.9882352941, blue: 0.862745098, alpha: 1))]), startPoint: .bottom, endPoint: .top)
                        .frame(width: geometry.size.width * 1.5, height: geometry.size.height)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .offset(x: -geometry.size.width / 4, y: -geometry.size.height / 2)
                    
                    VStack(spacing: 24) {
                        TitleView()
                        ZStack {
                            ForEach(self.users, id: \.self) { user in
                                Group {
                                    // Range Operator
                                    if (self.maxID - 3)...self.maxID ~= user.id {
                                        CardView(card: user, onRemove: { removedUser in
                                            // Remove that user from our array
                                            gameManagerVM.verifyAnswer(index: removedUser.id)
                                            self.users.removeAll { $0.id == removedUser.id }
                                           
                                        })
                                        .frame(width: self.getCardWidth(geometry, id: user.id), height: 400)
                                        .offset(x: 0, y: self.getCardOffset(geometry, id: user.id))
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }.padding()
        }
    }
}
    
    struct TitleView: View {
        var body: some View {
            VStack {
                HStack {
                    VStack(alignment: .center) {
                        ReusableText(text: "Match it right", size: 30)
                            .padding()
                    }
                    Spacer()
                }.padding()
            }
            .background(Color.red)
            .cornerRadius(10)
            .shadow(radius: 5)
        }
    }
    
struct CardContentView_Previews: PreviewProvider {
        static var previews: some View {
            CardContentView(gameManagerVM: CardManagerVM())
        }
    }
    
