//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Marina on 14.07.22.
//

import Foundation
import UIKit
 
class FeedViewController: UIViewController {
    private let networkService = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        networkService.getFeed()
    }
}
