//
//  UniversityListingProtocols.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation


// `Service` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityListingService: UniversityListingServiceActions {
}
//`View` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityListingView: UniversityListingViewActions {
   
    var presenter: UniversityListingPresenterViewActions! { get set }
}
// `Interactor` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityListingInteractor: UniversityListingInteractorActions {
}

// `Presenter` will implement  delegate. If you want to add more actions you can confirm here.
protocol UniversityListingPresenter: UniversityListingPresenterViewActions, UniversityListingPresenterInteractorActions {
   
    init(view: UniversityListingViewActions,
         interactor: UniversityListingInteractorActions,
         router: UniversityListingRouterActions
    )
}

// `Router` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityListingRouter: UniversityListingRouterActions {
}
