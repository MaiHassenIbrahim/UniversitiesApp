//
//  UniversityDetailDelegates.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation

// `Presenter` from previous module will implement this.
public protocol UniversityDetailDelegates: AnyObject {
    //Called when user tap on refresh button from the view.
    func refreshList()
}
