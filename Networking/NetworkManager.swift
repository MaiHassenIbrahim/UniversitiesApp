//
//  NetworkManager.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation


//MARK: NetworkManager singleton object.
class NetworkManager {
    // Only Shared instance of `NetworkManager`
    static let shared = NetworkManager()
    
    private init() { }
  
    func parseData<T: Codable>(_ data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }

    func urlParser(baseURL: String, endPoint: String, params: [String: String]?) -> URLComponents? {
        guard var components = URLComponents(string: baseURL+endPoint) else {
            return nil
        }
        if let params {
            components.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value)}
        }
        return components
    }

    func makeGetRequest<T: Codable>(endPoint: String, params: [String: String]? = nil, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let components = urlParser(baseURL: APIConstants.baseURL, endPoint: endPoint, params: params) else {
            completion(.failure(NetworkingErrors.serverDown))
            return
        }
        
        guard let url = components.url else {
            completion(.failure(NetworkingErrors.invalidQueryParams))
            return
        }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkingErrors.invalidResponse))
                return
            }
            do {
                let obj: T = try self.parseData(data)//try JSONDecoder().decode(T.self, from: data)
                completion(.success(obj))
            } catch let jsonErr {
                debugPrint(jsonErr)
                completion(.failure(NetworkingErrors.failToParse))
            }
        }.resume()
    }
}

