//
//  UniversityDetailProtocolActions.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation

// `View` will implement these actions. `Presenter` should be responsible to hold these actions.
// Presenter can use use these actions to interact with View.
protocol UniversityDetailViewActions: AnyObject {
 
    func setupUI()

    func addUniversityDetail()
}
// `Interactor` will implement these actions. `Presenter` should be responsible to hold these actions.
// Presenter can use use these actions to interact with Interactor.
protocol UniversityDetailInteractorActions: AnyObject {

    func getUniversityDetails() -> UniversityDetailDomain
}
// `Presenter` will implement these actions. `View` should be responsible to hold these actions.
// View can use use these actions to interact with Presenter.
protocol UniversityDetailPresenterViewActions: AnyObject {
   
    var navigationTitle: String {get}

    func viewDidLoad()
   
    func configure(detailView: DetailViewActions)
}
// `Presenter` will implement these actions. `Interactor` should be responsible to hold these actions.
// Interactor can use use these actions to interact with Presenter.
protocol UniversityDetailPresenterInteractionActions: AnyObject {
    
}
// `Router` will implement these actions. `Presenter` should be responsible to hold these actions.
// Presenter can use use these actions to interact with Router.
protocol UniversityDetailRouterActions: AnyObject {
    func go(to route: UniversityDetailRouterImpl.Routes)
}
