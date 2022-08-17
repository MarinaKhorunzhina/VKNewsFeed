//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Marina on 17.08.22.
//

import Foundation

struct UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
}
