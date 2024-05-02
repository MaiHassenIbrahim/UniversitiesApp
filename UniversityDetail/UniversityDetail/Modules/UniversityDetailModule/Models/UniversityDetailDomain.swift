//
//  UniversityDetailDomain.swift
//  UniversityDetail
//
//  Created by Mai Hassen on 02/05/2024.
//

import Foundation

//MARK: UniversityDetailDomain structure.
public struct UniversityDetailDomain {
    // University name
    public let universityName: String
    // Optional University Webpage URL
    public let webPage: URL?
    // Domain of university
    public let domain: String
    
    //Public initialiser.
    public init(universityName: String, webPage: URL?, domain: String) {
        self.universityName = universityName
        self.webPage = webPage
        self.domain = domain
    }
}
