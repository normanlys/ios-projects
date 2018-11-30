//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Norman Lim on 23/11/2018.
//  Copyright © 2018 Norman Lim. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    
    @objc var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
