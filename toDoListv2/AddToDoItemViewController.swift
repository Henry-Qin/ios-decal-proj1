//
//  AddToDoItemViewController.swift
//  toDoListv2
//
//  Created by Henry Qin on 10/19/16.
//  Copyright © 2016 Henry Qin. All rights reserved.
//

import UIKit

class AddToDoItemViewController: UIViewController {
    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var taskDetailsField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var task: Task?
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        print("safjd")
//        if self.saveButton === sender {
//            print("Henry")
//            let taskName = taskNameField.text
//            let taskDetails = taskDetailsField.text
//            task = Task(taskName: taskName, taskDetails: taskDetails, completed: false, timeCompleted: nil, isDeletedBefore24: false, isDeletedAfter24: false)
//        }
//    }
    func setTask() {
        let taskName = taskNameField.text
        let taskDetails = taskDetailsField.text
        task = Task(taskName: taskName, taskDetails: taskDetails, completed: false, timeCompleted: nil, isDeletedBefore24: false, isDeletedAfter24: false)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
