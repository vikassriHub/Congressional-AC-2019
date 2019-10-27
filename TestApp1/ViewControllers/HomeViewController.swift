//
//  HomeViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 8/25/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ElectricityField: UITextField!
    @IBOutlet weak var GasField: UITextField!
    @IBOutlet weak var FuelField: UITextField!
    @IBOutlet weak var PropaneField: UITextField!
    @IBOutlet weak var SignOutBTN: UIButton!
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var UpdateBtn: UIButton!
    @IBOutlet weak var HouseButton: UIButton!
    @IBOutlet weak var TransportationBtn: UIButton!
    @IBOutlet weak var WasteButton: UIButton!
    
    var dataDescription = [String:Double].self
    var Electricity = 0.0
    var Gas = 0.0
    var Fuel = 0.0
    var Propane = 0.0
    var Total = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Constants.TotalAmount.Amount)
        Utilities.styleFilledButton(SignOutBTN)
        Utilities.styleFilledButton(TransportationBtn)
        Utilities.styleFilledButton(WasteButton)
        Utilities.styleHollowButton(HouseButton)
        Utilities.styleFilledButton(UpdateBtn)
        Utilities.styleTextField(ElectricityField)
        Utilities.styleTextField(GasField)
        Utilities.styleTextField(FuelField)
        Utilities.styleTextField(PropaneField)
        
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(Constants.UserID.UID)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                Constants.TotalAmount.Amount = dataDescription!["Total"] as! Double
                self.AmountLabel.text = "\(Constants.TotalAmount.Amount) lbs of carbon"
            } else {
                print("Document does not exist")
                db.collection("users").document(Constants.UserID.UID).setData([
                "Total": 57.625,
                ]) { (error) in
                
                if error != nil {
                    // Show error message
                    print("Error saving user data")
                }
                else{
                    
                    
                }
            }
        }
        
    }
}
    
    @IBAction func SignOutTapped(_ sender: Any) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(Constants.UserID.UID)
        docRef.updateData([
            "Total": Constants.TotalAmount.Amount
        ])
        let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            }
            catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
    }
    @IBAction func UpdateBtnTapped(_ sender: Any) {
       
        Electricity = Double(ElectricityField.text!)!
        Electricity = Electricity * 1.24
        Gas = Double(GasField.text!)!
        Gas = Gas * 11.7
        Fuel = Double(FuelField.text!)!
        Fuel = Fuel * 22.61
        Propane = Double(PropaneField.text!)!
        Propane = Propane * 12.43
        Total = Electricity + Gas + Fuel + Propane
        Total = (Total * 1000).rounded()/1000
        Constants.TotalAmount.Amount = Constants.TotalAmount.Amount + Total
        self.AmountLabel.text = "\(Constants.TotalAmount.Amount) lbs of carbon"
    }
}
