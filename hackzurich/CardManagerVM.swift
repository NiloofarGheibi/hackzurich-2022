//
//  CardManagerVM.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 17.09.22.
//

import Foundation


class CardManagerVM : ObservableObject {
    
    static var currentIndex = 0
    
    static func createGameCardModel(i:Int) -> CardQuiz {
        return CardQuiz(currentQuestionIndex: i, cardModel: cardData[i])
    }
    
    @Published var model = CardManagerVM.createGameCardModel(i: CardManagerVM.currentIndex)
}

extension CardManagerVM
{
    static var cardData: [CardModel] {
        [
            CardModel(question: "Are the glaciers already melting?", answer: true),
            CardModel(question: "Is it too late to prevent climate change?", answer: false),
            CardModel(question: "Are the glaciers already melting1?", answer: true),
            CardModel(question: "Is it too late to prevent climate change1?", answer: false)
        ]
    }
}

