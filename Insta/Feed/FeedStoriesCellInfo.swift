//
//  FeedStoriesCellInfo.swift
//  Insta
//
//  Created by Nikita Gavrilov on 01.03.2023.
//

import UIKit

struct FeedStoriesItemCellInfo {
    let image: UIImage
    let username: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool 
}

typealias FeedStoriesCellInfo = [FeedStoriesItemCellInfo]
