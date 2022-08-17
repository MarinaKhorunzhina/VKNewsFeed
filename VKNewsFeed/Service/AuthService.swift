//
//  AuthService.swift
//  VKNewsFeed
//
//  Created by Marina on 13.07.22.
//

import Foundation
import VK_ios_sdk

protocol AuthServiceDeledate: AnyObject {
    func authServiceShouIdShow(viewController: UIViewController)
    func authServiceSignIn()
    func authServiceSignInDidFail()
}

class AuthService: NSObject, VKSdkDelegate,VKSdkUIDelegate {
    
    private let appId = "8218170"
    private let vkSdk: VKSdk
    override init(){
        vkSdk = VKSdk.initialize(withAppId: appId)
        super.init()
        vkSdk.register(self)
        vkSdk.uiDelegate = self
            print("VKSdk.initialize")
    
     }
    weak var delegate: AuthServiceDeledate?
    
    var token: String? {
        return VKSdk.accessToken()?.accessToken
    }
    var userId: String? {
        return VKSdk.accessToken()?.userId
    }
    
    func wakeUpSession () {
        let scope = ["wall", "friends"]
        VKSdk.wakeUpSession(scope) { [delegate ](state, error) in
            switch state {
            case .initialized:
                print("initialized")
                VKSdk.authorize(scope)
            case .authorized:
                print("authorized")
                delegate?.authServiceSignIn()
            default:
                delegate?.authServiceSignInDidFail()
             
            }
    }
    }
   
   
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print(#function)
        if result.token != nil {
            delegate?.authServiceSignIn()
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        print(#function)
        delegate?.authServiceSignInDidFail()
    }
    
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print(#function)
        delegate?.authServiceShouIdShow(viewController: controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print(#function)
    }
}
