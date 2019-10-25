
//
//  SignUpViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 8/25/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var FirstNameTxtField: UITextField!
    @IBOutlet weak var LastNameTxtField: UITextField!
    @IBOutlet weak var EmailTxtField: UITextField!
    @IBOutlet weak var PasswordTxtField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    @IBOutlet weak var ErrorLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
       
    }

    
    //Set up the design of all elements
    
    func setUpElements() {
        
        ErrorLabel.alpha = 0
        
        Utilities.styleFilledButton(SignUpButton)
        Utilities.styleTextField(FirstNameTxtField)
        Utilities.styleTextField(LastNameTxtField)
        Utilities.styleTextField(EmailTxtField)
        Utilities.styleTextField(PasswordTxtField)
        
    }
    
    //Validate to make sure all fields are ok
    
    func ValidateFields () -> String?{
        
        if FirstNameTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LastNameTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTxtField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill out all of the fields"
        }
    
        //Check if the Email is valid
        
        let CleanedEmail = EmailTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isEmailValid(CleanedEmail) == false {
            return "Please enter a valid email"
        }
        
        //Check if the Password is valid
        
        let CleanedPassword = PasswordTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(CleanedPassword) == false {
            return "Make sure your password contains at least 8 characters, contains a special character, and a number"
        }
        
        return nil
        
    }
    
    //Show any errors
    func showError (_ message:String){
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }

    //Switches to home
    func transitionToHome() {
        
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    
    //When Sign Up Button is tapped
    
    @IBAction func SignUpBtnTapped(_ sender: Any) {
        
        //Validate the fields
        
        let error = ValidateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            //Create User
            let FirstName = FirstNameTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let LastName = LastNameTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let Email = EmailTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let Password = PasswordTxtField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create the user
            Auth.auth().createUser(withEmail: Email, password: Password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    //Save other fields
                    
                    let db = Firestore.firestore()
                    
                    db.collection("users").document(result!.user.uid).setData([
                        "FirstName":FirstName,
                        "LastName":LastName,
                        "Total": 0,
                        ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                        else{
                            
                            Constants.UserID.UID = result!.user.uid
                            self.transitionToHome()
                            
                        }
                    }
                }
            }
        }
    }
}
