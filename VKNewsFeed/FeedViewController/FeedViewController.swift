//
//  FeedViewController.swift
//  VKNewsFeed
//
//  Created by Marina on 14.07.22.
//

import Foundation
import UIKit
 
class FeedViewController: UIViewController {
    private let networkService: Networking = NetworkService()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        let params = ["filters": "post, photo"]
        
        networkService.request(path: API.newsFeed, params: params) { (data, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                guard let data = data else {return}
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                print("json: \(String(describing: json))")
            }
        }
    }
}
