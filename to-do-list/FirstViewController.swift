//
//  FirstViewController.swift
//  to-do-list
//
//  Created by 田中　博成 on 2016/07/10.
//  Copyright © 2016年 hiropon. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var table: UITableView!
    
    
    
  var selectedText: String?
    var selectedContent: String?
    
    @IBAction func back(segue:UIStoryboardSegue){//戻るボタン用
        print("back")
    }
    
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    
     {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            myItemList.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
        
    }

    

     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return myItemList.count
    }
    

     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    
    {
        let mycell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "mycell")
        mycell.textLabel?.text = myItemList[indexPath.row]
        return mycell
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        myTableView.reloadData()
    }

    override func viewDidLoad() {
                super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(table: UITableView, didSelectRowAtIndexPath indexPath:NSIndexPath) {
        
        selectedText = myItemList[indexPath.row]
        selectedContent = myContentList[indexPath.row]
        
        if selectedText != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegueWithIdentifier("seguetest",sender: nil)
        }
    }
    



// Segue 準備
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    if (segue.identifier == "seguetest") {
        let indexPath = self.myTableView.indexPathForSelectedRow
        let subVC: ThirdViewController = (segue.destinationViewController as? ThirdViewController)!
        // SubViewController のselectedImgに選択された画像を設定する
        subVC.selecteddt = myContentList[indexPath!.row]
        subVC.selectedtxt = myItemList[indexPath!.row]
    }



}

}

