//
//  IdlingViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 10/30/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit

class IdlingViewController: UIViewController {

    @IBOutlet weak var IdlingButton: UIButton!
    @IBOutlet weak var CleanerButton: UIButton!
    @IBOutlet weak var TreeButton: UIButton!
    @IBOutlet weak var CarpooliButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleHollowButton(IdlingButton)
        Utilities.styleFilledButton(CleanerButton)
        Utilities.styleFilledButton(TreeButton)
        Utilities.styleFilledButton(CarpooliButton)
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
