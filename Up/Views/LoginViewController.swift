//
//  LoginViewController.swift
//  Up
//
//  Created by David Taylor on 5/21/17.
//  Copyright © 2017 Hyper Elephant. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Result

class LoginViewController: UIViewController {

    public var viewModel: LoginViewModel = LoginViewModel()
    var signingUp = false
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var emailCheckmark: CheckmarkView!
    @IBOutlet weak var passwordCheckmark: CheckmarkView!
    @IBOutlet weak var usernameCheckmark: CheckmarkView!
    
    @IBAction func emailEntered(_ sender: Any) {
        if emailTextField.text!.contains("@") {
            emailCheckmark.isHidden = false
        } else {
            emailCheckmark.isHidden = true
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if !signingUp{
            signingUp = true
            usernameTextField.isHidden = false
            loginButton.setTitle("Sign Up", for: UIControlState())
            signUpButton.setTitle("Already registered? Log in!", for: UIControlState())
        } else {
            signingUp = false
            usernameTextField.isHidden = true
            loginButton.setTitle("Log In", for: UIControlState())
            signUpButton.setTitle("Not registered? Sign up!", for: UIControlState())
        }

    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if let email = self.emailTextField.text, let password = self.passwordTextField.text{
            viewModel.login(email: email, password: password, completed: { (errorString) in
                if let error = errorString{
                    self.showAlert(error)
                    return
                }
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            })
        }
        else{
            self.showAlert("email/password can't be empty")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
