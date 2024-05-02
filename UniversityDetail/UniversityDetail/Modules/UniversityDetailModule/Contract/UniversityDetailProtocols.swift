//
//  UniversityDetailProtocols.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation


//`View` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityDetailView: UniversityDetailViewActions {
  
    var presenter: UniversityDetailPresenterViewActions! { get set }
}
//`Interactor` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityDetailInteractor: UniversityDetailInteractorActions {
}
// `Presenter` will implement  delegate. If you want to add more actions you can confirm here.
protocol UniversityDetailPresenter: UniversityDetailPresenterViewActions, UniversityDetailPresenterInteractionActions {
  
    init(view: UniversityDetailViewActions,
         interactor: UniversityDetailInteractorActions,
         router: UniversityDetailRouterActions,
         delegates: UniversityDetailDelegates?
    )
    
}
// `Router` will implement only this delegate. If you want to add more actions you can confirm here.
protocol UniversityDetailRouter: UniversityDetailRouterActions {
}
