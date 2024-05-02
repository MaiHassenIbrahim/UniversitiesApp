//
//  UniversityListingProtocolsActions.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation
import UniversityDetail


protocol UniversityListingServiceActions: AnyObject {

    func fetchUniversityList(forceRefresh: Bool, completion: @escaping ((Result<[UniversityListResponse], Error>) -> Void))
}

// `View` will implement these actions. `Presenter` should be responsible to hold these actions.
// Presenter can use use these actions to interact with View.
protocol UniversityListingViewActions: AnyObject {
    //Use this method when all setup resource are ready and view is ready to setup.
    func setupUI()
    //Use this method to add `UniversityListView`.
    func addUniversityList()
    // Use this method to show `UIActivityIndicatorView` or any custom loader you are using.
    func showLoader()
    //Use this method to hide `UIActivityIndicatorView` or any custom loader you are using.
    func hideLoader()
}

// Interacter` will implement these actions. `Presenter` should be responsible to hold interactor actions.
// Use these actions to interact with interactor.
protocol UniversityListingInteractorActions: AnyObject {
    // Use this method to fetch universities list from local database or server.
    func fetchUniversityList(forceRefresh: Bool)
    // Use this method to fetch universities list from local database or server.
    func getUniversity(at index: Int) -> UniversityDetailDomain?
}

// `Presenter` will implement these actions. `View` should be responsible to hold these actions.
// View can use use these actions to interact with Presenter.
protocol UniversityListingPresenterViewActions: AnyObject {
    func viewDidLoad()
    // Use this method to configure `UniversityListView` .
    func configure(universityListView: UniversityListViewActions)
}

//`Router` will implement these actions. `Presenter` should be responsible to hold these actions.
// Presenter can use use these actions to interact with Router.
protocol UniversityListingRouterActions: AnyObject {
    // Use this method navigation .
    func go(to route: UniversityListingRouterImpl.Routes)
}

// `Presneter` will implement these actions. `Interactor` should be responsible to hold these actions.
// Interactor can use use these actions to interact with Presenter.
protocol UniversityListingPresenterInteractorActions {
    // Call this method from `Interactor` when universties are fetched .
    func fetchUniversitySuccess(universities: [UniversityListCellModel])
    
    // Call this method from `Interactor` when there is some error that needs to be handled .
    func handleError(error: String)
}

// `UniversityNetworkDataSource` will implement these actions. `Service` should be responsible to hold these actions.
// Service can use use these actions to interact with `UniversityNetworkDataSource`.
protocol UniversityNetworkActions: AnyObject {
    // Use this method to fetch universities list from server.
    func fetchUniversityList(completion: @escaping ((Result<[UniversityListResponse], Error>) -> Void))
}

// `UniversityLocalStorage` will implement these actions. `Service` should be responsible to hold these actions.
// Service can use use these actions to interact with `UniversityLocalStorage`.
protocol UniversityLocalStorageDataActions: AnyObject {
    // Use this method to save list of universities to local storage..
    func saveToLocalStorage(universities: [UniversityListResponse], completion: (()->Void)?)
    
    // Use this method to get list of universities from local storage..
    func getFromLocalStorage() -> [UniversityListResponse]
    
    //Use this method to clear local storage.
    func clearLocalStorate(completion: @escaping (()->Void))
}
