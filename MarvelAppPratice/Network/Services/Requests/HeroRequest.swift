//
//  HeroRequest.swift
//  MarvelAppPratice
//
//  Created by Student on 11/04/22.
//

import Foundation

enum HeroRequest: URLRequestProtocol {
    
    case home(String?)
    case details
    
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        
        let timestamp = NSDate().timeIntervalSince1970.description
        
        switch self {
        case .home(let searchHero):
            var pathHome = "limit=30&ts=\(timestamp)&apikey=\(Environment.publicKey)&hash=\(hashMD5(timestamp: timestamp))"
            if let search = searchHero {
                pathHome += "&nameStartsWith=\(search)"
            }
            return pathHome
        case .details:
            return "details=423432424"
        }
        
    }
    
    var method: HTTPMethod {
            return .get
    }
    
}
