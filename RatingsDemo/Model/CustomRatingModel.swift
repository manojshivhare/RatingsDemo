//
//  CustomRatingModel.swift
//  RatingsDemo
//
//  Created by Manoj Shivhare on 17/04/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import Foundation

struct CustomRatingModel {
    var ratings:String?
    var dateTime:String?

    init(ratings:String,date:String) {
        self.ratings = ratings
        self.dateTime = date
    }
}
