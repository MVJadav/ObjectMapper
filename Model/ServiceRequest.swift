//
//  ServiceRequest.swift
//  MyDemo
//
//  Created by JadavMehul on 29/11/16.
//

import UIKit
import ObjectMapper


class ServiceRequest<T: Mappable>: Mappable {
    
    
    var Key: NSString?
    var Token: NSString?
    var Data : T?
    
    init() {
        Token   =   ""
        Key     =   Constant.HttpParameter.APIKey as NSString?;
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        Key         <- map["Key"]
        Token      <- map["Token"]
        Data       <- map["Data"]
        
    }
}

