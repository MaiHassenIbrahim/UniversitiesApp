//
//  UniversityListingViewController.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import UIKit
//MARK: ViewController implementation
class UniversityListingViewController: UIViewController, UniversityListingView {
    //Stack view which will hold all subviews.
    @IBOutlet weak var contentView: UIView!
    // @IBOutlet weak var contentView: UIStackView!
    // Activity indicator view. Use this to show / stop loading animation
    @IBOutlet weak var loaderActivity: UIActivityIndicatorView!
    
    
    var presenter: UniversityListingPresenterViewActions!
  
 
    private lazy var universityListView = UniversityListView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
    // This will initialise `UniversityListingViewController` from `xib`.
    convenience init() {
        self.init(nibName: "\(UniversityListingViewController.self)", bundle: nil)
    }

}

//MARK: View Delegate Methods
extension UniversityListingViewController {
    
    func setupUI() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        loaderActivity.layer.cornerRadius = 8
    }

    func addUniversityList() {
        universityListView = UniversityListView.fromNib()
        presenter.configure(universityListView: universityListView)
        contentView.addSubview(universityListView)
    }
    
    func showLoader() {
        loaderActivity.startAnimating()
    }
    
    func hideLoader() {
        loaderActivity.stopAnimating()
    }
}
