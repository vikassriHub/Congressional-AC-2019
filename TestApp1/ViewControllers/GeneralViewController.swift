//
//  GeneralViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 9/1/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit

class GeneralViewController: UIViewController {

    @IBOutlet weak var GeneralButton: UIButton!
    @IBOutlet weak var RecycleButton: UIButton!
    @IBOutlet weak var CompostButton: UIButton!
    @IBOutlet weak var LandfillButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements(){
        
        Utilities.styleHollowButton(GeneralButton)
        Utilities.styleFilledButton(RecycleButton)
        Utilities.styleFilledButton(CompostButton)
        Utilities.styleFilledButton(LandfillButton)

        
    }

}
