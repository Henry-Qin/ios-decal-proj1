//
//  Task.swift
//  toDoListv2
//
//  Created by Henry Qin on 10/19/16.
//  Copyright © 2016 Henry Qin. All rights reserved.
//

import UIKit

struct Task{

    var taskName: String?
    var taskDetails: String?
    var completed: Bool
    var timeCompleted: TimeInterval?
    var isDeletedBefore24 : Bool?
    var isDeletedAfter24 : Bool?
    let limit = 86400.0
    
    init(taskName: String?, taskDetails:String?, completed:Bool, timeCompleted: TimeInterval?, isDeletedBefore24: Bool?, isDeletedAfter24: Bool?) {
        self.taskName = taskName
        self.taskDetails = taskDetails
        self.completed = completed
        self.timeCompleted = timeCompleted
        self.isDeletedBefore24 = isDeletedBefore24
        self.isDeletedAfter24 = isDeletedAfter24
    }
    
    
}
