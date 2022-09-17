//
//  GameManagerVM.swift
//  AKQuiz
//
//  Created by Rocha, Isabelly on 16.09.22.
//

import Foundation
import SwiftUI

class GameManagerVM : ObservableObject {

    static var currentIndex = 0
    
    static func createGameModel(i:Int) -> Quiz {
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
    
    
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        for index in model.quizModel.optionsList.indices {
            model.quizModel.optionsList[index].isMatched = false
            model.quizModel.optionsList[index].isSelected = false
            
        }
        if let index = model.quizModel.optionsList.firstIndex(where: {$0.optionId == selectedOption.optionId}) {
            if selectedOption.optionId ==  model.quizModel.answer {
                model.quizModel.optionsList[index].isMatched = true
                model.quizModel.optionsList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    if (GameManagerVM.currentIndex < 2) {
                        GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                        self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                    } else {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            } else {
                model.quizModel.optionsList[index].isMatched = false
                model.quizModel.optionsList[index].isSelected = true
            }
        }
    }
    
    func restartGame() {
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
        self.start()
    }
    
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
            if self.progress == self.maxProgress {
                self.model.quizCompleted = true
                self.model.quizWinningStatus = false
                self.reset()
            } else {
                self.progress += 1
            }
        })
    }
                                     
    func reset () {
        timer.invalidate()
        self.progress = 0
    }
}

extension GameManagerVM
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "How many of the ten hottest years have already occurred since 2000?",
                      answer: "C",
                      optionsList: [QuizOption(id: 11, optionId: "A", option: "2", color: Color.yellow),
                                    QuizOption(id: 12,optionId: "B", option: "3", color: Color.red),
                                    QuizOption(id: 13,optionId: "C", option: "9", color: Color.green),
                                    QuizOption(id: 14,optionId: "D", option: "10", color: Color.purple)]),
            
            QuizModel(question: "The annual average temperature will rise by how many degrees by the end of the century?",
                      answer: "A",
                      optionsList: [QuizOption(id: 21,optionId: "A", option: "3.3 to 5.4 °C", color: Color.yellow),
                                    QuizOption(id: 22,optionId: "B", option: "2.0 to 6.6 °C", color: Color.red),
                                    QuizOption(id: 23,optionId: "C", option: "1.5 to 2.0 °C", color: Color.green),
                                    QuizOption(id: 24,optionId: "D", option: "not much", color: Color.purple)]),
            
            QuizModel(question: "Water consumption has decreased slightly since the 1990s, and in the recent years?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "increasing", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "B", option: "decreased", color: Color.red),
                                    QuizOption(id: 33,optionId: "C", option: "increased", color: Color.green),
                                    QuizOption(id: 34,optionId: "D", option: "stable", color: Color.purple)]),
            
            QuizModel(question: "What is the largest water storage resource in Switzerland?",
                      answer: "A",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "Groundwater", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "B", option: "Lakes", color: Color.red),
                                    QuizOption(id: 33,optionId: "C", option: "Rivers", color: Color.green),
                                    QuizOption(id: 34,optionId: "D", option: "Damm", color: Color.purple)]),
            
            QuizModel(question: "How many percent of the 22,500 km of piste in Switzerland were created with artificial snow in 2016?",
                      answer: "C",
                      optionsList: [QuizOption(id: 31,optionId: "A", option: "5%", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "B", option: "10%", color: Color.red),
                                    QuizOption(id: 33,optionId: "C", option: "49%", color: Color.green),
                                    QuizOption(id: 34,optionId: "D", option: "20%", color: Color.purple)])
        ]
    }
}
