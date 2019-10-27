//
//  TransportationViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 10/26/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class TransportationViewController: UIViewController {

    @IBOutlet weak var HouseButton: UIButton!
    @IBOutlet weak var TransportationButton: UIButton!
    @IBOutlet weak var WasteButton: UIButton!
    @IBOutlet weak var SignOutBtn: UIButton!
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var UpdateButton: UIButton!
    @IBOutlet weak var VehicleNumberField: UITextField!
    @IBOutlet weak var MileageField: UITextField!
    @IBOutlet weak var MilesField: UITextField!
    
    var Total = 0.0
    var VehicleNumber = 0.0
    var Mileage = 0.0
    var MilesDriven = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleFilledButton(HouseButton)
        Utilities.styleFilledButton(WasteButton)
        Utilities.styleHollowButton(TransportationButton)
        Utilities.styleFilledButton(UpdateButton)
        Utilities.styleTextField(VehicleNumberField)
        Utilities.styleTextField(MileageField)
        Utilities.styleTextField(MilesField)
        Utilities.styleFilledButton(SignOutBtn)

        AmountLabel.text = "\(Constants.TotalAmount.Amount) lbs of carbon"
        
    }
    
    @IBAction func UpdateBtnTapped(_ sender: Any) {
        
        VehicleNumber = Double(VehicleNumberField.text!)!
        Mileage = Double(MileageField.text!)!
        MilesDriven = Double(MilesField.text!)!
        Total = MilesDriven/Mileage
        Total = (Total * 1000).rounded()/1000
        print(Total)
        Total = Total * 19.6
        Total = VehicleNumber * Total
        
        Constants.TotalAmount.Amount = Constants.TotalAmount.Amount + Total
        AmountLabel.text = "\(Constants.TotalAmount.Amount) lbs of carbon"
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
}
