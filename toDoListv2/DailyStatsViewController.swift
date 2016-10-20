//
//  DailyStatsViewController.swift
//  toDoListv2
//
//  Created by Henry Qin on 10/19/16.
//  Copyright © 2016 Henry Qin. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {
    
    @IBOutlet var tasksCompletedText: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    
    var numberOfItems: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = String(numberOfItems!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setNumberOfItems(number: Int) {
        numberOfItems = number
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
