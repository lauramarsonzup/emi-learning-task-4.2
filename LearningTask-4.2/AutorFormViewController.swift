//
//  ViewController.swift
//  LearningTask-4.2
//
//  Created by rafael.rollo on 17/02/2022.
//

import UIKit

class AutorFormViewController: UIViewController {
    
    @IBOutlet weak var photoTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var technologiesTextField: UITextField!
    
    typealias ValidationMessage = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func savePressed(_ sender: UIButton) {
        
        switch validateFormsFields() {
            
        case (false, let validationMessage):
            showAlert(title: "Erro", message: validationMessage)
            
        default :
            registerAuthor()
        }

    }
    
    func validateFormsFields() -> (Bool, ValidationMessage?) {
        guard let photo = photoTextField.text, !photo.isEmpty else {
            return (false, "Informe a URL da foto do autor")
        }
        
        guard let name = nameTextField.text, !name.isEmpty else {
            return (false, "Nome não pode estar em branco")
        }
        
        guard let bio = bioTextField.text, !bio.isEmpty else {
            return (false, "A bio do autor não pode estar em branco")
        }
        
        guard let technologies = technologiesTextField.text, !technologies.isEmpty else {
            return (false, "Informe as tecnologias sobre as quais o autor escreve")
        }
        
        return (true, nil)
    }
    
    func showAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        
        self.present(alert, animated: true)
    }
    
    func registerAuthor() {
        showAlert(title: "Feito", message: "Autor cadastrado com sucesso")
        eraseFormsFields()
    }
    
    func eraseFormsFields() {
        [photoTextField, nameTextField, bioTextField, technologiesTextField].forEach { textField in
            textField?.text = ""
        }
    }
}
