//
//  MainViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 10/22/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var GifView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        GifView.loadGif(name: "Earth")
        
    }
}
