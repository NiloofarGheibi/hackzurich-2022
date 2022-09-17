//
//  CardManagerVM.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 17.09.22.
//

import Foundation

class CardManagerVM : GameManagerVM {
    
    static func createGameCardModel(i:Int) -> CardQuiz {
        return CardQuiz(currentQuestionIndex: i, cardModel: cardData[i])
    }
    
    @Published var cards = CardManagerVM.createGameCardModel(i: CardManagerVM.currentIndex)
    
    var maxCardProgress = 9
    var progressedCards = 0
    
    func verifyAnswer(index: Int) {
        if progressedCards == maxCardProgress {
            print(index)
            self.cards.cardCompleted = true
            self.cards.cardWinningStatus = true
            print("verify-answer-if")
        }else {
            self.progressedCards+=1
            print("verify-answer-else")
        }
    }
    
    override func restartGame() {
        CardManagerVM.currentIndex = 0
        cards = CardManagerVM.createGameCardModel(i: CardManagerVM.currentIndex)
        self.start()
    }
    
    override func start() {
        reset()
    }
                  
    override func reset () {
        self.progress = 0
        self.cards.cardCompleted = false
        self.cards.cardWinningStatus = false
    }
}

extension CardManagerVM
{
    static var cardData: [CardModel] {
        [
            CardModel(image: "bg_1", question: "Are the glaciers already melting?", answer: true),
            CardModel(image: "bg_1", question: "Is it too late to prevent climate change?", answer: false),
            CardModel(image: "bg_1", question: "Are the glaciers already melting1?", answer: true),
            CardModel(image: "bg_1", question: "Is it too late to prevent climate change1?", answer: false)
        ]
    }
}

