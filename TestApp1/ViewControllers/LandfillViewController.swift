//
//  LandfillViewController.swift
//  TestApp1
//
//  Created by Varun Srivastava on 9/1/19.
//  Copyright © 2019 Varun Srivastava. All rights reserved.
//

import UIKit

class LandfillViewController: UIViewController {
    @IBOutlet weak var QuizButton: UIButton!
    @IBOutlet weak var RecycleButton: UIButton!
    @IBOutlet weak var CompostButton: UIButton!
    @IBOutlet weak var LandfillButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
    }
    

    func setUpElements (){
        
        Utilities.styleFilledButton(QuizButton)
        Utilities.styleFilledButton(RecycleButton)
        Utilities.styleFilledButton(CompostButton)
        Utilities.styleHollowButton(LandfillButton)

    }
    @IBAction func QuizBtnClicked(_ sender: Any) {
        
        func openUrl(urlStr: String!) {
            if let url = URL(string:urlStr), !url.absoluteString.isEmpty {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        
        }
        openUrl(urlStr: "https://studio.code.org/projects/applab/3PwfR4n1SkKdRZtPIWGcr8O7yBAtg3GALi5er7eDOP0")
    }
}
