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
    @IBOutlet weak var DecreaseBox: UIButton!
    @IBOutlet weak var IncreaseBox: UIButton!
    @IBOutlet weak var DecreaseMilk: UIButton!
    @IBOutlet weak var IncreaseMilk: UIButton!
    @IBOutlet weak var DecreaseBottle: UIButton!
    @IBOutlet weak var IncreaseBottle: UIButton!
    @IBOutlet weak var DecreaseBag: UIButton!
    @IBOutlet weak var IncreaseBag: UIButton!
    @IBOutlet weak var DecreaseTree: UIButton!
    @IBOutlet weak var IncreaseTree: UIButton!
    @IBOutlet weak var SignOutBTN: UIButton!
    @IBOutlet weak var AmountLabel: UILabel!
    
    
    var Amount = 0
    var dataDescription = [String:Int].self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleFilledButton(SignOutBTN)
        
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(Constants.UserID.UID)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data()
                self.Amount = dataDescription!["Total"] as! Int
                self.AmountLabel.text = "\(self.Amount) g"
            } else {
                print("Document does not exist")
            }
            
        }
        
    }
    
    @IBAction func SignOutTapped(_ sender: Any) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(Constants.UserID.UID)
        docRef.updateData([
            "Total": self.Amount
        ])
        let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            }
            catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
    }
    @IBAction func BoxIncrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintIncrease("Box", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
    }
    @IBAction func BoxDecrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintDecrease("Box", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
    }
    @IBAction func MilkIncrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintIncrease("Milk", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
    }
    @IBAction func MilkDecrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintDecrease("Milk", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
    }
    @IBAction func BottleIncrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintIncrease("Bottle", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
        print(Amount)
        
    }
    @IBAction func BottleDecrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintDecrease("Bottle", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
        print(Amount)
    }
    @IBAction func BagIncrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintIncrease("Bag", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
    }
    @IBAction func BagDecrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintDecrease("Bag", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
    }
    @IBAction func TreeIncrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintIncrease("Tree", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
    }
    @IBAction func TreeDecrease(_ sender: Any) {
        let footprint = Utilities.carbonFootprintDecrease("Tree", Amount)
        Amount = footprint
        AmountLabel.text = "\(Amount) g"
    }
}
