//
//  TodoList.swift
//  Checklist
//
//  Created by Norman Lim on 23/11/2018.
//  Copyright © 2018 Norman Lim. All rights reserved.
//

import Foundation

class TodoList {
    
    enum Priority: Int, CaseIterable {
        case high, medium, low, no
    }
    
    private var highPriority: [ChecklistItem] = []
    private var mediumPriority: [ChecklistItem] = []
    private var lowPriority: [ChecklistItem] = []
    private var noPriority: [ChecklistItem] = []
    
    init() {
        let row0Item = ChecklistItem()
        let row1Item = ChecklistItem()
        let row2Item = ChecklistItem()
        let row3Item = ChecklistItem()
        let row4Item = ChecklistItem()
        
        row0Item.text = "Take a jog"
        row1Item.text = "Watch a movie"
        row2Item.text = "Code an app"
        row3Item.text = "Walk the dog"
        row4Item.text = "Study design patterns"
        
        addTodo(row0Item, for: .medium)
        addTodo(row1Item, for: .medium)
        addTodo(row2Item, for: .medium)
        addTodo(row3Item, for: .medium)
        addTodo(row4Item, for: .medium)
    }
    
    func addTodo(_ item: ChecklistItem, for priority: Priority, at index: Int = -1) {
        switch priority {
        case .high:
            if index < 0 {
                highPriority.append(item)
            } else {
                highPriority.insert(item, at: index)
            }
        case .medium:
            if index < 0 {
                mediumPriority.append(item)
            } else {
                mediumPriority.insert(item, at: index)
            }
        case .low:
            if index < 0 {
                lowPriority.append(item)
            } else {
                lowPriority.insert(item, at: index)
            }
        case .no:
            if index < 0 {
                noPriority.append(item)
            } else {
                noPriority.insert(item, at: index)
            }
        }
    }
    
    func todolist(for priority: Priority) -> [ChecklistItem] {
        switch priority {
        case .high:
            return highPriority
        case .medium:
            return mediumPriority
        case .low:
            return lowPriority
        case .no:
            return noPriority
        }
    }
    
    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        mediumPriority.append(item)
        return item
    }
    
    func move(item: ChecklistItem, from sourcePriority: Priority, at sourceIndex: Int, to destinationPriority: Priority, at destinationIndex: Int) {
        remove(item, from: sourcePriority, at: sourceIndex)
        addTodo(item, for: destinationPriority, at: destinationIndex)
    }
    
    func remove(_ item: ChecklistItem, from priority: Priority, at index: Int) {
        switch priority {
        case .high:
            highPriority.remove(at: index)
        case .medium:
            mediumPriority.remove(at: index)
        case .low:
            lowPriority.remove(at: index)
        case .no:
            noPriority.remove(at: index)
        }
    }
    
    private func randomTitle() -> String {
        var titles = ["New todo item", "Generic todo", "Fill me out", "I need sth to do", "Much todo about nth"]
        return titles[Int.random(in: 0...titles.count-1)]
    }
}
