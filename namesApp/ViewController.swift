//
//  ViewController.swift
//  namesApp
//
//  Created by FeoLika on 21.09.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var yourNameTF: UITextField!
    @IBOutlet weak var parnersNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getResult() {
        guard let firstName = yourNameTF.text, let secondName = parnersNameTF.text else {return}
        if firstName.isEmpty || secondName.isEmpty{
            showAlert(title: "Dissmissing names", message: "Please enter both names")
            return
        }
        performSegue(withIdentifier: "resultView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ResultViewController else {return}
        
        destination.firstName = yourNameTF.text
        destination.secondName = parnersNameTF.text
    }
    @IBAction func unwindSegueAction(segue: UIStoryboardSegue){
        yourNameTF.text = ""
        parnersNameTF.text = ""
    }
}
extension ViewController{
    private func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
extension ViewController : UITextFieldDelegate{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == yourNameTF{
            parnersNameTF.becomeFirstResponder()
        }
        else{
            getResult()
        }
        return true
        
    }
}
