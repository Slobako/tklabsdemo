//
//  SignInViewController.swift
//  tklabsdemo
//
//  Created by Slobodan Kovrlija on 5/18/19.
//  Copyright © 2019 Slobodan Kovrlija. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var usernameLine: UIView!
    @IBOutlet weak var passwordLine: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self

        setupViews()
    }
    
    func setupViews() {
        loginButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 8
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        backImageView.addGestureRecognizer(tap)
        backImageView.isUserInteractionEnabled = true
    }
    
    @objc func backTapped() {
        dismiss(animated: true, completion: nil)
    }

    // Dismisses keyboard when tapped outside of text fields
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

}

// MARK: - TextField delegate
extension SignInViewController: UITextFieldDelegate {
    
    private func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            changeLineColorFor(line: usernameLine)
        }
        if textField == passwordTextField {
            changeLineColorFor(line: passwordLine)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == usernameTextField {
            changeLineColorFor(line: usernameLine)
        }
        if textField == passwordTextField {
            changeLineColorFor(line: passwordLine)
        }
    }
    
    func changeLineColorFor(line: UIView) {
        if line.backgroundColor != UIColor.green {
            line.backgroundColor = UIColor.green
        } else {
            line.backgroundColor = UIColor.darkGray
        }
    }
}
