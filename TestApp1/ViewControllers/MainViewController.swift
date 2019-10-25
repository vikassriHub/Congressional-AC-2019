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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
