//
//  Recipe.swift
//  IOSBasicMVP
//
//  Created by Pablo Jiménez on 23/1/17.
//  Copyright © 2017 Pablo Jiménez. All rights reserved.
//

import Foundation
import ObjectMapper

struct Recipe {
    var id : CLong?
    var name = ""
    var photo = ""
}

extension Recipe: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id       <- map["id"]
        name     <- map["name"]
    }
}
