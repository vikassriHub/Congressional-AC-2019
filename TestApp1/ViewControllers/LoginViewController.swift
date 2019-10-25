//
//  LoginViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 8/25/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class LoginViewController: UIViewController {
    @IBOutlet weak var EmailTxtField: UITextField!
    @IBOutlet weak var PasswordTxtField: UITextField!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        ErrorLabel.alpha = 0
        
        Utilities.styleFilledButton(LoginButton)
        Utilities.styleTextField(EmailTxtField)
        Utilities.styleTextField(PasswordTxtField)
        
    }
    
    func ValidateFields () -> String?{
        
        if  EmailTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            return "Please fill out all of the fields"
            
        }
        
        return nil
        
    }
    
    //Show any errors
    func showError (_ message:String){
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    //Switch to the home page
    func transitionToHome() {
        
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
    }

    
    @IBAction func LoginTapped(_ sender: Any) {
        
        let error = ValidateFields()
        
        if error != nil {
            showError(error!)
        }
        
        let Email = EmailTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let Password = PasswordTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: Email, password: Password) { (result, err) in
            
            
            if err != nil {
                
                // Couldn't login
                self.showError("Incorrect Email or Password")
                
            }
            else {
                
                //Could login
                Constants.UserID.UID = result!.user.uid
                self.transitionToHome()
            }
        }
        
        

        
    }
    
    
}
