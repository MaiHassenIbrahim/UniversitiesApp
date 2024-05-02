//
//  UniversityDetailPresenter.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation

//MARK: Presenter implementation
class UniversityDetailPresenterImpl: UniversityDetailPresenter {
    //Holds View actions
    let view: UniversityDetailViewActions
    //Holds Interactor actions
    let interactor: UniversityDetailInteractorActions
    //Holds Router actions
    let router: UniversityDetailRouterActions
    //Holds View actions
    weak var detailView: DetailViewActions?
    // Holds `UniversityDetailDelegates` delegates. Use this to communicate with confirming module.
    fileprivate weak var delegates: UniversityDetailDelegates?
    var navigationTitle: String  = "Details"
    
    
    required init(view: UniversityDetailViewActions,
                  interactor: UniversityDetailInteractorActions,
                  router: UniversityDetailRouterActions,
                  delegates: UniversityDetailDelegates?) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.delegates = delegates
    }
    
    func viewDidLoad() {
        view.setupUI()
        view.addUniversityDetail()
    }
    
    func configure(detailView: DetailViewActions) {
        self.detailView = detailView
        self.detailView?.dataSource = interactor.getUniversityDetails()
        self.detailView?.didTapRefresh = {[weak self] in
            self?.delegates?.refreshList()
            self?.router.go(to: .goBack)
        }
    }

    
    
}
