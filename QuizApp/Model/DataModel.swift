//
//  DataModel.swift
//  QuizApp
//
//  Created by ALUNO on 06/04/22.
//

import Foundation
class DataModel{
    private static var sharedDataModel = DataModel()
    let question:[Question]
    var nome = ""
    var placar = 0
    var scoreBoard:[ScoreEntry]{
        get{
            return sqlite.getScoreEntries()
        }
    }
    var sqlite = SQLiteDatabase()
    
    private init(){
        question = [
            Question(questionText: "Quem aparece na imagem?", imageName: "bob", options: ["Bob Esponja","Bob Esponjo","Beto Esponja","Roberto Esponja"], rightOption: 0),
            Question(questionText: "Qual a catch frase do personagem da imagem?", imageName: "cartman", options: ["I like ballons","Errrou","O que vamos fazer hoje a noite pink?","Oh my god they killed kenny!"], rightOption: 3),
            Question(questionText: "Selecione a frase verdadeira", imageName: "hommer", options: ["O personagem gosta de trabalhar","O nome do personagem é Simpson","O personagem tem 2 filhos","O personagem gosta de cerveja!"], rightOption: 3),
            Question(questionText: "Quem é o personagem?", imageName: "rick", options: ["rock","rick","rack","ruck"], rightOption: 1),
            Question(questionText: "Quem é o personagem?", imageName: "morty", options: ["morty","marte","morgado","marty"], rightOption: 0)
        ]
    }
    func insertNewScore(score:ScoreEntry){
        _ = sqlite.insertScoreEntry(scoreEntry: score)
    }
    class func shared() -> DataModel{
        return sharedDataModel
    }
}
