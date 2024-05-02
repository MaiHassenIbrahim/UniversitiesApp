//
//  UIView+Extension.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import UIKit

//MARK: View extension
extension UIView {
    //Loads a view from the nib.
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}