//
//  AuthService.swift
//  VKNewsFeed
//
//  Created by Marina on 13.07.22.
//

import Foundation
import VK_ios_sdk

class AuthService: VKSdkDelegate, VKSdkUIDelegate {
    
    private let appId = "8218170"
    private let vkSdk: VKSdk
    init(){
        vkSdk = VKSdk.initialize(withAppId: appId)
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        <#code#>
    }
    
    func vkSdkUserAuthorizationFailed() {
        <#code#>
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        <#code#>
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        <#code#>
    }
    
    func isEqual(_ object: Any?) -> Bool {
        <#code#>
    }
    
    var hash: Int
    
    var superclass: AnyClass?
    
    func `self`() -> Self {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!, with object: Any!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func perform(_ aSelector: Selector!, with object1: Any!, with object2: Any!) -> Unmanaged<AnyObject>! {
        <#code#>
    }
    
    func isProxy() -> Bool {
        <#code#>
    }
    
    func isKind(of aClass: AnyClass) -> Bool {
        <#code#>
    }
    
    func isMember(of aClass: AnyClass) -> Bool {
        <#code#>
    }
    
    func conforms(to aProtocol: Protocol) -> Bool {
        <#code#>
    }
    
    func responds(to aSelector: Selector!) -> Bool {
        <#code#>
    }
    
    var description: String
    
    
   
    
}
