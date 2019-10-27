//
//  WasteViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 10/26/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class WasteViewController: UIViewController {

    @IBOutlet weak var SignOutButton: UIButton!
    @IBOutlet weak var HouseButton: UIButton!
    @IBOutlet weak var TransportationButton: UIButton!
    @IBOutlet weak var WasteButton: UIButton!
    @IBOutlet weak var AmountLabel: UILabel!
    @IBOutlet weak var PlasticField: UITextField!
    @IBOutlet weak var GlassField: UITextField!
    @IBOutlet weak var MetalField: UITextField!
    @IBOutlet weak var NewspaperField: UITextField!
    @IBOutlet weak var MagazinesField: UITextField!
    @IBOutlet weak var UpdateButton: UIButton!
    
    var Total = 0.0
    var Plastic = ""
    var Glass = ""
    var Metal = ""
    var Newspapers = ""
    var Magazines = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleFilledButton(SignOutButton)
        Utilities.styleFilledButton(HouseButton)
        Utilities.styleFilledButton(TransportationButton)
        Utilities.styleHollowButton(WasteButton)
        Utilities.styleFilledButton(UpdateButton)
        Utilities.styleTextField(PlasticField)
        Utilities.styleTextField(GlassField)
        Utilities.styleTextField(MetalField)
        Utilities.styleTextField(NewspaperField)
        Utilities.styleTextField(MagazinesField)

        AmountLabel.text = "\(Constants.TotalAmount.Amount) lbs of carbon"
        
    }
    
    @IBAction func UpdateBtnTapped(_ sender: Any) {
        
        Plastic = PlasticField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Glass = GlassField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Metal = MetalField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Newspapers = NewspaperField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        Magazines = MagazinesField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Plastic == "Y" {
            Total = Total - 2.96
        }
        if Glass == "Y" {
            Total = Total - 2.12
        }
        if Metal == "Y" {
            Total = Total - 7.45
        }
        if Newspapers == "Y" {
            Total = Total - 9.43
        }
        if Magazines == "Y" {
            Total = Total - 2.29
        }
        Total = (Total * 1000).rounded()/1000
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
