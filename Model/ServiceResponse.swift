//
//  ServiceResponse.swift
//  MyDemo
//
//  Created by JadavMehul on 29/11/16.
//

import UIKit
import ObjectMapper

class ServiceResponse<T: Mappable>: Mappable {
    
    var IsSuccess: Bool?
    var Code: Int?
    var Message: String? = ""
    var Data: T?
    
    init?() {
        
    }
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        IsSuccess    <- map["IsSuccess"]
        Code         <- map["Code"]
        Message      <- map["Message"]
        Data       <- map["Data"]
        
    }
}

class ServiceResponsewithError<T: Mappable, E: Mappable>: Mappable {
    
    var IsSuccess: Bool?
    var Code: Int?
    var Message: String?
    var Data: T?
    var Errors: [E]?
    
    init?() {
        
    }
    required init?(map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        IsSuccess    <- map["IsSuccess"]
        Code         <- map["Code"]
        Message      <- map["Message"]
        Data       <- map["Data"]
        Errors       <- map["Errors"]
        
    }
}
