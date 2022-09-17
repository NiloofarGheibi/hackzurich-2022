//
//  CardModel.swift
//  hackzurich
//
//  Created by Niloofar Gheibi on 17.09.22.
//

import Foundation

struct CardQuiz {
    var currentQuestionIndex: Int
    var cardModel: CardModel
    var cardCompleted: Bool = false
    var cardWinningStatus: Bool = false
}

struct CardModel: Hashable {
    let question: String
    let answer: Bool
}
