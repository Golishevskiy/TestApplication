//
//  NewsModel.swift
//  TestApplication
//
//  Created by Petro Golishevskiy on 19.03.2022.
//

import Foundation

struct NewsModel: Codable {
    let posts: [Post]
}

struct Post: Codable {
    let postID, timeshamp: Int
    let title, previewText: String
    let likesCount: Int

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case timeshamp, title
        case previewText = "preview_text"
        case likesCount = "likes_count"
    }
}
