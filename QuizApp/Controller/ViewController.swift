//
//  ViewController.swift
//  QuizApp
//
//  Created by ALUNO on 06/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (nameTextField.text?.count ?? 0) <= 0{
            let alert = UIAlertController(title: "Erro", message: "O nome não deveria estar vazio", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.cancel))
            present(alert, animated: true)
            return
        }
        DataModel.shared().nome = nameTextField.text!
        DataModel.shared().placar = 0
    }


}

