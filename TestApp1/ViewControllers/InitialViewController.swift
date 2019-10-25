//
//  InitialViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 9/1/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var WasteBtn: UIButton!
    @IBOutlet weak var AirBtn: UIButton!
    @IBOutlet weak var CarbonBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    func setUpElements () {
        Utilities.styleFilledButton(WasteBtn)
        Utilities.styleFilledButton(AirBtn)
        Utilities.styleFilledButton(CarbonBtn)
    }
    
}
