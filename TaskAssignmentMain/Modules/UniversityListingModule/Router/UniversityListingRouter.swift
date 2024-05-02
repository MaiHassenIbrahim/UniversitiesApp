//
//  UniversityListingRouter.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import UIKit
import UniversityDetail

//MARK: Router implementation
final class UniversityListingRouterImpl {
    //Enumiraction with associated values. Contains all navigation routes.
    enum Routes {

        case pushDetailScreen(university: UniversityDetailDomain, delegates: UniversityDetailDelegates?)
    }
  
    let navigationController: UINavigationController

    private init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
 
    static func create(navController: UINavigationController) -> UIViewController {
        let view = UniversityListingViewController()
        
        let router = UniversityListingRouterImpl(navigationController: navController)
        let service = UniversityListingServiceImpl(
            localDataSource: UniversityLocalStorage(),
            networkDataSource: UniversityNetworkDataSource())
        let interactor = UniversityListingInteractorImpl(service: service)
        let presenter = UniversityListingPresenterImpl(
            view: view,
            interactor: interactor,
            router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
//MARK: UniversityListingRouter delegates
extension UniversityListingRouterImpl: UniversityListingRouter {
    func go(to route: Routes) {
        switch route {
            case let .pushDetailScreen(university, delegate):
                pushUniversityDetailScreen(university: university, delegate: delegate)
        }
    }
}
//MARK: Fileprivate methods
extension UniversityListingRouterImpl {
     // push university details screen
    fileprivate func pushUniversityDetailScreen(university: UniversityDetailDomain, delegate: UniversityDetailDelegates?) {
        let controller = UniversityDetailRouterImpl.create(
            navController: navigationController,
            university: university,
            delegates: delegate)
        navigationController.pushViewController(controller, animated: true)
    }
}
