//
//  Constant.swift
//  MyDemo
//
//  Created by JadavMehul on 29/11/16.
//

import Foundation
import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let currentDevice = UIDevice.current.model
let defaultYear = "1970";

class Constant
{
    
    class HttpParameter
    {
        ///MARK: - APIKey
        static let APIKey = "I_d712c1c9-1e10-4z65-8ef0-m9c9103abaey"
        static let DeviceType = "IOS"
        
        static let ImagesType = "UserProfileImage"
        
        // MARK: - Constant
        static let HttpType_POST = "POST"
        static let HttpType_GET = "GET"
        
        //MARK:-Upload Image
        static let File = "file"
        static let Mimetype = "image/jpg"
        static let Filename = "team-icon.jpg"
        static let UserFilename = "user-profile.jpg"
        
        
        //MARK:-Upload Image Folder Image
        static let UploadFirmImages = "UploadFirmImages"
        static let UploadPostImages = "UploadPostImages"
        static let UploadSampleImages = "UploadSampleImages"
        static let UploadChatImages = "UploadChatImages"
        
        static let FirmImageWidth = 600.0
        static let FirmImageHeight = 600.0
        
        // MARK: - Error Code
        static let Error_500 = "500" //Oops something went wrong
        static let Error_410 = "410" //Token Expierd
        static let Error_400 = "400" //Error Message
        static let Error_401 = "401" //User Not Verify
        static let Error_200 = "200" //Succsessfull
        
        // MARK: - CometChat
        static let Chat_Key = "946d6eeaca9c6069b7920e582fd98228"
    }
    
    /*
     // MARK: - Preference
     */
    class Preference {
        
        
        static let PrefToken = "PrefToken"
        static let PrefUserId = "PrefUserId"
        static let MaxFirmAllowedToCreate = "MaxFirmAllowedToCreate"
        static let PrefMobileConnectionTimeout = "MobileConnectionTimeout"
        static let PrefMobileNumber = "PrefMobileNumber"
        

    }
    
    
    class ToastParameter {
        /*
         // MARK; Set Imagename For Toast Message
         */
        static let Image_Error : UIImage = UIImage(named:"Toast_Error.png")!
        static let Color_Error = UIColor.red
    }
   


    class AppSyncMessage {
        static let SyncFailMessage      = "App is not synced properly. Please retry."
        static let RequestFail          = "Network error, please try after some time."
        static let NoInternetConnection = "No internet connection found. Please restart app with internet connection."
    }
    
    
    class variables {
        static let OK = "OK"
        static let Error = "Error"
    }
    
}
