//
//  HttpRequest.swift
//  MyDemo
//
//  Created by JadavMehul on 29/11/16.
//

import UIKit


class HttpRequest: NSObject {
    
    static var currerntTask : URLSessionTask? = nil
    
    
    class func servicecall(url: String, HttpMethod: String, InputParameter: String, view:UIViewController? = nil, ServiceCallBack: @escaping (_ result: String?, _ error: NSError?)-> Void!) {
        
        if(Reachability.isConnectedToNetwork())
        {
            var jsonDictionary: NSDictionary!
            let myUrl = NSURL(string: url);
            print(url)
            let request = NSMutableURLRequest(url:myUrl! as URL);
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpMethod = HttpMethod
            print(InputParameter)
            //For Test
            let postString = InputParameter;
            request.httpBody = postString.data(using: String.Encoding.utf8);
            let session = URLSession.shared
            //Add timeOut
            request.timeoutInterval = Double(Prefrence.preferenceGetInteger(key: Constant.Preference.PrefMobileConnectionTimeout))
            HttpRequest.currerntTask  = session.dataTask(with: request as URLRequest){
                (data, response, error) -> Void in
                if error != nil {
                    ServiceCallBack(nil, error as NSError?)
                    //actview
                    AlertviewHelper().getAlertViewMessage(message: "Http Request Error")
                    
                } else {
                    do {
                        jsonDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
    
                        print("jsonDictionary== ", jsonDictionary)
                        
                        if (((jsonDictionary.value(forKey: "Code")) != nil) && ((jsonDictionary.value(forKey: "Code")) as! String == Constant.HttpParameter.Error_500)){
                            
                            ServiceCallBack(nil, error as NSError?)
                            
                            let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
                            concurrentQueue.sync {
                                
                                //hideIndicator(inView: (appDelegate.window?.currentViewController()?.view)!)
                                //                                SCLAlertView().showCloseButton = false;
                                //                                SCLAlertView().addButton(Constant.variables.OK, target:self, selector:#selector(HttpRequest.RequestFail))
                                //                                SCLAlertView().showError(Constant.variables.Error, subTitle:(jsonDictionary.valueForKey("Message") as! String))
                                
                            }
                        }
                        else if (((jsonDictionary.value(forKey: "Code")) != nil) && ((jsonDictionary.value(forKey: "Code")) as! String == Constant.HttpParameter.Error_410)){
                            
                            //print(jsonDictionary)
                            ServiceCallBack(nil, error as NSError?)
                            
                            let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
                            concurrentQueue.sync {
                                Prefrence.tokanExpClear()
                                //let loginVC = LoginVC(nibName:"LoginVC",bundle: nil)
                                appDelegate.window?.backgroundColor = UIColor.clear
                                //let navigationController = UINavigationController(rootViewController: loginVC)
                                //appDelegate.window?.rootViewController = navigationController
                                //                                appDelegate.window?.rootViewController?.view.makeToast(message: ((jsonDictionary.value(forKey: "Message") as! String)), duration: 2, position: HRToastPositionDefault as AnyObject, image: Constant.ToastParameter.Image_Error, BackGroundcolor: Constant.ToastParameter.Color_Error)
                                appDelegate.window?.makeKeyAndVisible()
                            }
                        }
                        else if (((jsonDictionary.value(forKey: "Code")) != nil) && ((jsonDictionary.value(forKey: "Code")) as! String == Constant.HttpParameter.Error_401)){
                            
                            let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
                            concurrentQueue.sync {
                                
                                if view != nil {
                                    
                                    ServiceCallBack(nil, error as NSError?)
                                    
                                    let alert = UIAlertController(title: "Warning", message: ((jsonDictionary.value(forKey: "Message") as! String)), preferredStyle: UIAlertControllerStyle.alert)
                                    
                                    let ActiveNow = UIAlertAction(title: "Active Now", style: UIAlertActionStyle.default)
                                    {
                                        UIAlertAction in
                                        
                                        //let objUserVarification = UserVarification(nibName:"UserVarification",bundle: nil)
                                        //objUserVarification.strOTPNumber = ""
                                        
                                        //                                        objUserVarification.strMobile = Prefrence.preferenceGetString(Constant.Preference.PrefMobileNumber)!
                                        //                                        objUserVarification.hidesBottomBarWhenPushed = true
                                        //                                        view!.navigationController?.pushViewController(objUserVarification, animated: true)
                                        
                                    }
                                    let ActiveLater = UIAlertAction(title: "Not Now", style: UIAlertActionStyle.cancel)
                                    {
                                        UIAlertAction in
                                        ServiceCallBack(nil, error as NSError?)
                                    }
                                    
                                    // Add the actions
                                    alert.addAction(ActiveNow)
                                    alert.addAction(ActiveLater)
                                    
                                    view!.present(alert, animated: true, completion: nil)
                                }
                                else {
                                    let datastring = NSString(data:data!, encoding:String.Encoding.utf8.rawValue) as String?
                                    //ServiceCallBack(result: datastring, error: nil)
                                    ServiceCallBack(datastring, nil)
                                }
                                
                            }
                        }
                        else{
                            
                            let datastring = NSString(data:data!, encoding:String.Encoding.utf8.rawValue) as String?
                            ServiceCallBack(datastring, nil)
                        }
                        
                    } catch let error as NSError{
                        print("JSON Error: \(error.localizedDescription)")
                    }
                    
                }
            }
            HttpRequest.currerntTask!.resume()
        }
        else
        {
            
            //            hideIndicator(inView: (appDelegate.window?.currentViewController()?.view)!)
            //            appDelegate.window?.currentViewController()?.view.userInteractionEnabled = true
            //            let alertError = SCLAlertView()
            //            alertError.showCloseButton = true;
            //            alertError.showWarning("Warning", subTitle: Constant.AppSyncMessage.NoInternetConnection, closeButtonTitle:Constant.variables.OK)
            ServiceCallBack(nil, nil)
        }
    }
   
    
    func RequestFail() {
        // Mehul24Nov
        //        SCLAlertView().showCloseButton=false;
        //        SCLAlertView().hideView()
    }
    
    class func ActivieNow() {
        
    }
    class func ActivieLater() {
        
    }
    class func cancelHttpReuest() {
        
        HttpRequest.currerntTask?.cancel()
    }
}

//MARK: -Response
/*
 
 jsonDictionary==  {
 Code = 200;
 Data =     {
     IsOtpSent = 0;
     LoginResponse =         {
         CachedData =             {
             DeviceUDID = "<null>";
             ExpireLogin = "2017-11-30T12:35:24 +05:30";
             Menubar = "<null>";
             Platform = "<null>";
             UserId = 50;
         };
         EncyptedUserId = "<null>";
         Token = "0f810f1b-2243-465a-b19b-0492aafed0de";
     };
     OtpCode = "<null>";
     User =         {
         ChatNotification = 1;
         City = Ahmedabad;
         CometChatUserId = "<null>";
         CreatedBy = 50;
         CreatedDate = "2016-11-21T22:21:16 +05:30";
         DeviceType = "<null>";
         DeviceUDID = "<null>";
         EncryptedUserId = MjIIX8OOVw44SXsChTgjQA2;
         FirmNotification = 1;
         FirstName = Mehul;
         IsActive = 1;
         IsVerified = 1;
         LastLoginDate = "2016-11-30T12:30:16 +05:30";
         LastName = Jadav;
         MobileNumber = 9601015499;
         Password = "mehul@123";
         PostNotification = 1;
         ProfilePhotoName = "user-profile.jpg";
         ProfileUrl = "http://49.50.81.121:82/uploads/users/50/a371a65b-1cd2-4610-94cc-efeca0b2e47e-201611281839169844.jpg";
         RoleId = 2;
         SampleNotification = 1;
         State = Gujarat;
         TempProfilePhotoName = "a371a65b-1cd2-4610-94cc-efeca0b2e47e-201611281839169844.jpg";
         UpdatedBy = 50;
         UpdatedDate = "2016-11-29T00:09:22 +05:30";
         UserId = 50;
     };
 };
 Errors = "<null>";
 IsSuccess = 1;
 Message = "You are now logged in";
 }

 
 */


