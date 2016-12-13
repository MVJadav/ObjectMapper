//
//  SecurityDataProvider.swift
//  MyDemo
//
//  Created by JadavMehul on 29/11/16.
//

import Foundation
import ObjectMapper

class SecurityDataProvider: NSObject {
    
    func Login (signupModel : LoginPostModel, ServiceCallBack: @escaping (_ result: String?, _ error: NSError?)-> Void! )
    {
        let serviceRequest = ServiceRequest<LoginPostModel>();
        serviceRequest.Data=signupModel;
        
        let JSONString = Mapper().toJSONString(serviceRequest);
        HttpRequest.servicecall(url: ServiceUrl.Login, HttpMethod:Constant.HttpParameter.HttpType_POST,  InputParameter: JSONString!,  ServiceCallBack: ServiceCallBack)
    }
    
}
