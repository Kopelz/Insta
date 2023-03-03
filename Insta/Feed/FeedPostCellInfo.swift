//
//  FeedPostCellInfo.swift
//  Insta
//
//  Created by Nikita Gavrilov on 01.03.2023.
//

import UIKit

struct FeedPostCellInfo {
    let userImage: UIImage
    let username: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentShortInfo?
}

struct CommentShortInfo {
    let username: String
    let commentText: String
}
