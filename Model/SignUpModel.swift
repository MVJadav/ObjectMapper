//
//  SignUpModel.swift
//  MyDemo
//
//  Created by JadavMehul on 29/11/16.
//

import Foundation
import ObjectMapper

class LoginResponse: Mappable{
    
    var Token: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        Token         <- map["Token"]
        
    }
}
