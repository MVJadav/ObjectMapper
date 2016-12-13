//
//  ViewController.swift
//  MyDemo
//
//  Created by JadavMehul on 29/11/16.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        callLogin()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func callLogin(){
        let objloginPostModel:LoginPostModel = LoginPostModel()
        objloginPostModel.MobileNumber = "9601015499"
        objloginPostModel.Password = "mehul@123"
        objloginPostModel.Platform = "I"
        objloginPostModel.DeviceType = Constant.HttpParameter.DeviceType
        
        
        let securitydataprovider: SecurityDataProvider = SecurityDataProvider()
        //        showIndicator(self.view)
        //        showCustomIndicatorInView(self.view, subView: btnLogin)
        
        
        securitydataprovider.Login(signupModel: objloginPostModel, ServiceCallBack:{(result: String?, error: NSError?) -> Void in
            if(result != nil)
            {
                
                let concurrentQueue = DispatchQueue(label: "queuename", attributes: .concurrent)
                concurrentQueue.sync {
                    
                    let serviceResponse = Mapper<ServiceResponse<LoginGetModel<LoginResponse,User>>>().map(JSONString: result!)
                    
                    //let serviceResponse = Mapper<ServiceResponsewithError<LoginGetModel<LoginResponse,User>,Errors>>().map(result);
                    print(serviceResponse)
                    
                    /*
                    if(serviceResponse?.IsSuccess == true)
                    {
                        self.redirection(serviceResponse)
                    }
                    else if(serviceResponse?.IsSuccess == false) {
                        self.alert_Fail.showCloseButton = false;
                        self.alert_Fail.addButton("OK", target:self, selector:#selector(LoginVC.Loginfail))
                        self.alert_Fail.showError("Error", subTitle:(serviceResponse?.Message)!)
                    }
                    */
                    
                }
            }
            else {
                
                print(result)
                
                /*
                dispatch_async(dispatch_get_main_queue()) {
                    self.view.userInteractionEnabled = true
                    self.btnLogin.hideLoading()
                }
                */
            }
        })
    }
    
    
}

