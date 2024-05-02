//
//  UniversityListingInteractor.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation
import UniversityDetail

//`UniversityListingInteractorImpl` implementation
class UniversityListingInteractorImpl: UniversityListingInteractor {
    typealias Service = UniversityListingServiceActions
    //Holds Service actions
    fileprivate let service: Service
    //Holds Presenter actions
    var presenter: UniversityListingPresenterInteractorActions?
    //Holds Universities actions
    fileprivate var universities = [UniversityListResponse]()

    init(service: Service) {
        self.service = service
    }

    fileprivate func fetchRemoteUniversities(forceRefresh: Bool) {
        service.fetchUniversityList(forceRefresh: forceRefresh) {[weak self] response in
            switch response {
                case .success(let response):
                    self?.universities = response
                    let universities = response.map {$0.toListCellDomain()}
                    DispatchQueue.main.async {
                        self?.presenter?.fetchUniversitySuccess(universities: universities)
                    }
                case .failure(let error):
                    self?.presenter?.handleError(error: error.localizedDescription)
            }
        }
    }
}

extension UniversityListingInteractorImpl {
    func fetchUniversityList(forceRefresh: Bool) {
        fetchRemoteUniversities(forceRefresh: forceRefresh)
    }
    
    func getUniversity(at index: Int) -> UniversityDetailDomain? {
        if universities.indices.contains(index) {
            let university = universities[index]
            return UniversityDetailDomain(universityName: university.name ?? "", webPage: URL(string: university.web_pages.first ?? ""), domain: university.domains.first ?? "")
        } else {
            return nil
        }
    }
}
