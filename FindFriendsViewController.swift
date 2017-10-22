//
//  FindFriendsViewController.swift
//  makestagram
//
//  Created by Yuriko Kondo on 2017/10/22.
//  Copyright © 2017年 Make School. All rights reserved.
//

import Foundation
class Post {
    var key: String?
    let imageURL: String
    let imageHeight: CGFloat
    let creationDate: Date
}

init(imageURL: String, imageHeight: CGFloat) {
    self.imageURL = imageURL
    self.imageHeight = imageHeight
    self.creationDate = Date()
}
