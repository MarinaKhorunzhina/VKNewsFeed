//
//  AuthViewController.swift
//  VKNewsFeed
//
//  Created by Marina on 13.07.22.
//

import UIKit
import VK_ios_sdk

class AuthViewController: UIViewController {

    private var authService: AuthService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        //authService = AuthService()
        authService = SceneDelegate.shared().authService
    }
    

    @IBAction func singInTouch(_ sender: UIButton) {
        authService.wakeUpSession()
    }
}

