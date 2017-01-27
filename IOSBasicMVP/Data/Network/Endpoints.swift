//
//  Endpoints.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 23/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://otakucook.herokuapp.com/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Recipes: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "recipes"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
