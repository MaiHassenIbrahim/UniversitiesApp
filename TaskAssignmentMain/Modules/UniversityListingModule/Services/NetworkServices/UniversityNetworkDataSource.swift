//
//  UniversityNetworkDataSource.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation

//MARK: UniversityNetworkDataSource implementation
class UniversityNetworkDataSource: UniversityNetworkActions {
    func fetchUniversityList(completion: @escaping ((Result<[UniversityListResponse], Error>) -> Void)) {
        NetworkManager.shared.makeGetRequest(endPoint: APIConstants.search, params: ["country": "United Arab Emirates"]) { (response: Result<[UniversityListResponse], Error>) in
            switch response {
                case .success(let success):
                    completion(.success(success))
                case .failure(let failure):
                    completion(.failure(failure))
            }
        }
    }
    
}
