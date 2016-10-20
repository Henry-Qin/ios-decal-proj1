//
//  TaskCell.swift
//  toDoListv2
//
//  Created by Henry Qin on 10/19/16.
//  Copyright © 2016 Henry Qin. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var completed: Bool!
    var timeCompleted : TimeInterval!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    var task: Task! {
        didSet {
            
            nameLabel.text = task.taskName
            detailsLabel.text = task.taskDetails
            completed = task.completed
            timeCompleted = task.timeCompleted
            
        }
    }

}
