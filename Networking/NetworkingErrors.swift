//
//  Networking+Errors.swift
//  TaskAssignmentMain
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation

enum NetworkingErrors: Error {
    case invalidResponse
    case failToParse
    case noInternet
    case invalidQueryParams
    case serverDown
}

extension NetworkingErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
         
            case .invalidResponse:
                return "API response is invalid."
            case .failToParse:
                return "Failed to parse data into json object. "
            case .noInternet:
                return "Internet connect is not available. Try again."
            case .invalidQueryParams:
                return "Query params are not valid. Try again."
            case .serverDown:
                return "Server is down right now. Try again later."
        }
    }
}
