//
//  UniversityDetailView.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import UIKit

class DetailView: UIView, DetailViewActions {
    // Displays Name  of university
    @IBOutlet var lblName: UILabel!
    // Displays Domain link of the university
    @IBOutlet var lblDomainLink: UILabel!
    // Displays web page URL of the university
    @IBOutlet var lblWebpage: UILabel!
    
    var didTapRefresh: (() -> Void)?
    var dataSource: UniversityDetailDomain? {
        didSet {
            modelAssigned()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // Call this method when `dataSource` is assigned.
    private func modelAssigned() {
        lblName.text = dataSource?.universityName
        lblDomainLink.text = dataSource?.domain
        lblWebpage.text = dataSource?.webPage?.absoluteString
    }
    //Action button method. Called when user click on Refresh button.
    @IBAction func actionRefresh(_ sender: Any) {
        didTapRefresh?()
    }
}
