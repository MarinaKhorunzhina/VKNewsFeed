//
//  NewsfeedModels.swift
//  VKNewsFeed
//
//  Created by Marina on 21.07.22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum Newsfeed {
   
  enum Model {
    struct Request {
      enum RequestType {
        case some
      }
    }
    struct Response {
      enum ResponseType {
        case some
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
      }
    }
  }
}
    struct FeedViewModel {
        struct Cell: FeedCellViewModel {
            var iconUrlString: String
            var name: String
            var date: String
            var text: String?
            var likes: String?
            var comments: String?
            var shares: String?
            var views: String?
        }
        let cells: [Cell]
}
