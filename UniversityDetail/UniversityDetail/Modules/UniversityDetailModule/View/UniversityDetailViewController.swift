//
//  UniversityDetailViewController.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import UIKit
//MARK: ViewController implementation
class UniversityDetailViewController: UIViewController, UniversityDetailView {
    //Stack view which will hold all subviews.
    @IBOutlet weak var contentStackView: UIStackView!
    
    
    var presenter: UniversityDetailPresenterViewActions!

    private lazy var detailView = DetailView()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
    }
    // This will initialise `UniversityDetailViewController` from `xib`.
    convenience init() {
        self.init(nibName: "\(UniversityDetailViewController.self)", bundle: Bundle(for: UniversityDetailViewController.self))
    }

}
//MARK: View Delegate Methods
extension UniversityDetailViewController {
    func setupUI() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        title = presenter.navigationTitle
    }
    
    func addUniversityDetail() {
        detailView = DetailView.fromNib()
        presenter.configure(detailView: detailView)
        contentStackView.addArrangedSubview(detailView)
    }
}
