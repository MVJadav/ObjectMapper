//
//  LoginModel.swift
//  MyDemo
//
//  Created by JadavMehul on 29/11/16.
//

import UIKit
import ObjectMapper


/*
 // Login GET Model
 */

class LoginGetModel <T: Mappable,S: Mappable>: Mappable {
    
    var LoginResponse : T?
    var User : S?
    
    required init()
    {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        LoginResponse    <- map["LoginResponse"]
        User    <- map["User"]
    }
}

class User: Mappable{
    
    var City : String?
    var CreatedBy : String?
    var CreatedDate : String?
    var DeviceType : String?
    var DeviceUDID : String?
    var EncryptedUserId : String?
    var FirstName : String?
    var IsActive : Bool?
    var IsVerified : Bool?
    var LastLoginDate : String?
    var LastName : String?
    var MobileNumber : String?
    var ProfilePhotoName : String?
    var ProfileUrl : String?
    var RoleId : Int?
    var State : String?
    var TempProfilePhotoName : String?
    var UpdatedBy : String?
    var UpdatedDate : String?
    var UserId : Int?
    
    required init()
    {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        MobileNumber    <- map["MobileNumber"];
        City    <- map["City"];
        CreatedBy    <- map["CreatedBy"];
        CreatedDate    <- map["CreatedDate"];
        DeviceType    <- map["DeviceType"];
        DeviceUDID    <- map["DeviceUDID"];
        EncryptedUserId    <- map["EncryptedUserId"];
        DeviceUDID    <- map["DeviceUDID"];
        FirstName    <- map["FirstName"];
        IsActive    <- map["IsActive"];
        IsVerified    <- map["IsVerified"];
        LastLoginDate    <- map["LastLoginDate"];
        LastName    <- map["LastName"];
        ProfilePhotoName    <- map["ProfilePhotoName"];
        ProfileUrl    <- map["ProfileUrl"];
        RoleId    <- map["RoleId"];
        State    <- map["State"];
        UpdatedBy    <- map["UpdatedBy"];
        TempProfilePhotoName    <- map["TempProfilePhotoName"];
        UpdatedBy    <- map["UpdatedBy"];
        UpdatedDate    <- map["UpdatedDate"];
        UserId    <- map["UserId"];
    }
}

/*
 // Login POST Model
 */
class LoginPostModel: Mappable
{
    var MobileNumber : String? = ""
    var Password : String?
    var DeviceUDID : String?
    var Platform : String?
    var OTP : String?
    var DeviceType : String?
    
    required init()
    {
        
    }
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        MobileNumber    <- map["MobileNumber"];
        Password    <- map["Password"];
        DeviceUDID    <- map["DeviceUDID"];
        Platform    <- map["Platform"];
        OTP    <- map["OTP"];
        DeviceType    <- map["DeviceType"];
    }
}
