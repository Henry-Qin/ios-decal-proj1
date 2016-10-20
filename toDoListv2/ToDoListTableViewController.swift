//
//  ToDoListTableViewController.swift
//  toDoListv2
//
//  Created by Henry Qin on 10/18/16.
//  Copyright © 2016 Henry Qin. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    
    var tasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        self.tableView.reloadData()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tasks.count
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {
        if let addToDoItemViewController = segue.source as? AddToDoItemViewController {
            if segue.identifier == "unwindUsingSave" {
                addToDoItemViewController.setTask()
            }
            if let task = addToDoItemViewController.task {
                tasks.append(task)
                let indexPath = NSIndexPath(row: tasks.count-1, section: 0)
                tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
            }
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dailyStatsViewController = segue.destination as? DailyStatsViewController {
            var counter = 0
            let x = tableView.numberOfRows(inSection: 0)
            if x != 0 {
                for i in 0...x-1 {
                    if tableView.cellForRow(at: NSIndexPath(row: i, section: 0) as IndexPath)!.accessoryType == .checkmark {
                        counter += 1
                    }
                }
                dailyStatsViewController.setNumberOfItems(number: counter)
            } else {
                dailyStatsViewController.setNumberOfItems(number: counter)
            }
        }
//        counter = 0
//        for i in 0...tableView.numberOfRows(inSection: 0) {
//            if tableView.cellForRow(at: NSIndexPath(row: i, section: 0) as IndexPath)!.accessoryType == .checkmark {
//               counter += 1
//            }
//        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
            as! TaskCell
        
        let task = tasks[indexPath.row] as Task
        cell.task = task
//        if !task.completed {
//            cell.accessoryType = .none
//        } else{
//            cell.accessoryType = .checkmark
//        }
        
        return cell
    }
 
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        let task = tasks[indexPath.row] as Task
        if !task.completed {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
            tasks[indexPath.row].timeCompleted = NSDate().timeIntervalSince1970
        }

        tasks[indexPath.row].completed = !task.completed
        tasks[indexPath.row].isDeletedBefore24 = false
        tasks[indexPath.row].isDeletedAfter24 = false
    }
 
    func update() {
        let x = self.tasks.count
        if x != 0 {
            for i in 0...x-1 {
                let index = NSIndexPath(row: i, section: 0) as IndexPath
                let cell = tableView.cellForRow(at: NSIndexPath(row: i, section: 0) as IndexPath)!
                if cell.accessoryType == .checkmark{
                    let limit = 86400.0
                    if NSDate().timeIntervalSince1970 - tasks[i].timeCompleted! > limit {
                        tableView.deleteRows(at: [index], with: .fade)
                        tasks.remove(at: i)
                    }
                }
            }
        }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
}
