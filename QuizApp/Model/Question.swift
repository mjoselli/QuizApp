//
//  Question.swift
//  QuizApp
//
//  Created by ALUNO on 06/04/22.
//

import Foundation
class Question{
    let questionText:String
    let imageName:String
    let options:[String]
    let rightOption:Int
    init(questionText:String,imageName:String,options:[String],rightOption:Int) {
        self.questionText = questionText
        self.imageName = imageName
        self.options = options
        self.rightOption = rightOption
    }
}
