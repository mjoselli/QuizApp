//
//  QuizViewController.swift
//  QuizApp
//
//  Created by ALUNO on 06/04/22.
//

import UIKit

class QuizViewController: UIViewController {

    // MARK: OUTLETS
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var questionButtons: [UIButton]!
    var currentQuestion = 0
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = DataModel.shared().question.shuffled()
        
        updateQuestionView(question: questions[currentQuestion])
        // Do any additional setup after loading the view.
    }
    // MARK: Update
    func updateQuestionView(question:Question){
        imageView.image = UIImage(named: question.imageName)
        questionLabel.text = question.questionText
        var options = question.options
        var optionsIndexes = [0,1,2,3]
        for i in 0..<questionButtons.count{
            let optionRand = Int.random(in: 0..<options.count)
            questionButtons[i].setTitle(options[optionRand], for: .normal)
            questionButtons[i].tag = optionsIndexes[optionRand]
            options.remove(at: optionRand)
            optionsIndexes.remove(at: optionRand)
        }
    }
    
    // MARK: Actions
    
    @IBAction func questionButtonPressed(_ sender: UIButton) {
        var text = ""
        let question = questions[currentQuestion]
        let dataModel = DataModel.shared()
        if sender.tag == question.rightOption{
            text = "Você Acertou"
            dataModel.placar += 10
        }else{
            text = "Errrou"
            dataModel.placar -= 5

        }
        let alert = UIAlertController(title: "Quiz", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
            self.currentQuestion += 1
            if self.currentQuestion >= self.questions.count{
                dataModel.insertNewScore(score: ScoreEntry(nome: dataModel.nome, score: dataModel.placar))
                //self.dismiss(animated: true)
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ScoreViewController")
                self.present(vc, animated: true)
            }else{
                self.updateQuestionView(question:
                    self.questions[self.currentQuestion]
                )
            }
        }))
        self.present(alert, animated: true)
        
    }
    
}
