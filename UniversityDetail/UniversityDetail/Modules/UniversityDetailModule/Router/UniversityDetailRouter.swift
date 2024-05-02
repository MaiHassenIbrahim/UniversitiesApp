//
//  UniversityDetailRouter.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import UIKit

//MARK: Router implementation
public final class UniversityDetailRouterImpl {
    //Enumiraction with associated values. Contains all navigation routes.
    enum Routes {
        //Go to previous screeen..
        case goBack
    }

    let navigationController: UINavigationController

    private init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    public static func create(navController: UINavigationController, university: UniversityDetailDomain, delegates: UniversityDetailDelegates? = nil) -> UIViewController {
        let view = UniversityDetailViewController()
        
        let router = UniversityDetailRouterImpl(navigationController: navController)
        let interactor = UniversityDetailInteractorImpl(university: university)
        let presenter = UniversityDetailPresenterImpl(
            view: view,
            interactor: interactor,
            router: router, 
            delegates: delegates)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}
//MARK: UniversityDetailRouter delegates
extension UniversityDetailRouterImpl: UniversityDetailRouter {
    func go(to route: Routes) {
        switch route {
            case .goBack:
                navigationController.popViewController(animated: true)
        }
    }
}
