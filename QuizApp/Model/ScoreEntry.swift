//
//  ScoreEntry.swift
//  QuizApp
//
//  Created by ALUNO on 13/04/22.
//

import Foundation
class ScoreEntry{
    internal init(nome: String, score: Int) {
        self.nome = nome
        self.score = score
    }
    var nome:String
    var score:Int
}
