//
//  ThirdViewController.swift
//  to-do-list
//
//  Created by 田中　博成 on 2016/07/17.
//  Copyright © 2016年 hiropon. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    var selectedtxt: String?
    var selecteddt: String?
        
    @IBOutlet weak var mainText: UITextView!
    @IBOutlet weak var date: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // Do any additional setup after loading the view.
        mainText.text = selecteddt
        date.text = selectedtxt
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
