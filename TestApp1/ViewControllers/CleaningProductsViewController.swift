//
//  CleaningProductsViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 10/30/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit

class CleaningProductsViewController: UIViewController {

    @IBOutlet weak var IdlingButton: UIButton!
    @IBOutlet weak var CleanerButton: UIButton!
    @IBOutlet weak var TreeButton: UIButton!
    @IBOutlet weak var CarpoolingButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleFilledButton(IdlingButton)
        Utilities.styleHollowButton(CleanerButton)
        Utilities.styleFilledButton(TreeButton)
        Utilities.styleFilledButton(CarpoolingButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
