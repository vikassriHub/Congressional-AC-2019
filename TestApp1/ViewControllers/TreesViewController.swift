//
//  TreesViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 10/30/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit

class TreesViewController: UIViewController {
    @IBOutlet weak var IdlingButton: UIButton!
    @IBOutlet weak var CleanersButton: UIButton!
    @IBOutlet weak var TreeButton: UIButton!
    @IBOutlet weak var Carpool: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Utilities.styleFilledButton(IdlingButton)
        Utilities.styleFilledButton(CleanersButton)
        Utilities.styleHollowButton(TreeButton)
        Utilities.styleFilledButton(Carpool)
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
