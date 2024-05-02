//
//  UniversityListViewCell.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import UIKit

class UniversityListViewCell: UITableViewCell {

    static let identifier = "UniversityListViewCell"

    @IBOutlet private var lblName: UILabel!

    @IBOutlet private var lblState: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
//MARK: UniversityListViewCell action delegates
extension UniversityListViewCell: UniversityListViewCellActions {
    func setup(dataSource: UniversityListCellModel) {
        lblName.text = dataSource.universityName
        lblState.text = dataSource.state
    }
}
