//
//  SecondViewController.swift
//  to-do-list
//
//  Created by 田中　博成 on 2016/07/10.
//  Copyright © 2016年 hiropon. All rights reserved.
//

import UIKit

var myItemList = [String]()
var myTextList = [String]()
var myContentList = [String]()


let defaults = NSUserDefaults.standardUserDefaults()

class SecondViewController: UIViewController {

    @IBOutlet weak var myItemText: UITextField!
        @IBOutlet weak var myDesc: UITextField!
    @IBOutlet weak var content: UITextView!

    
    
    
    override func viewDidLoad() {
     self.automaticallyAdjustsScrollViewInsets = false
        super.viewDidLoad()
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        view.endEditing(true)
        return true
    }

    @IBAction func AddText(sender: AnyObject) {
        if myItemText.text?.characters.count > 0 {
            myItemList.append(myItemText.text!)
            myItemText.text = ""
            myContentList.append(content.text!)
            content.text! = ""
            self.view.endEditing(true)
            defaults.setObject(myItemList, forKey: "openKey")
            defaults.setObject(myContentList, forKey: "openKey")
            defaults.synchronize()
           
        }
        
        
        
    }

}

