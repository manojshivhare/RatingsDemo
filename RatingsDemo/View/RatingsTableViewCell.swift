//
//  RatingsTableViewCell.swift
//  RatingsDemo
//
//  Created by Manoj Shivhare on 18/04/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import UIKit
import Cosmos

class RatingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingView.settings.starSize = 20.0
        ratingView.settings.fillMode = .full
        ratingView.settings.starMargin = 5.0
    }
    
    //Set up value into outlet
    var ratingArrModel: CustomRatingModel! {
        didSet {
            print("cell rating:",(ratingArrModel.ratings! as NSString).doubleValue)
            self.ratingView.settings.totalStars = Int((ratingArrModel.ratings! as NSString).intValue)
            self.ratingView.rating = (ratingArrModel.ratings! as NSString).doubleValue
            self.dateLabel?.text = String(format: "Date: %@", ratingArrModel.dateTime ?? 0)
        }
    }

}
