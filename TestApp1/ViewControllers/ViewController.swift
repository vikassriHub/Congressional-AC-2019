//
//  ViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 8/25/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var SignUpButtonHome: UIButton!
    @IBOutlet weak var LoginButtonHome: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(SignUpButtonHome)
        Utilities.styleFilledButton(LoginButtonHome)
        
    }


}

