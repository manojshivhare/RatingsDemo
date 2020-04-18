//
//  SetRatingsViewController.swift
//  RatingsDemo
//
//  Created by Manoj Shivhare on 17/04/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import UIKit
import Foundation
import Cosmos
import CoreData

class SetRatingsViewController: UIViewController {
        
    @IBOutlet weak var ratingView: CosmosView!
    
    var savedRatings = [String:Int]()
    var ratingStr:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(savedRatings["min"]!)
        ratingView.settings.totalStars = savedRatings["max"]!
        ratingView.settings.starSize = 30.0
        ratingView.settings.fillMode = .full
        ratingView.rating = Double(savedRatings["min"]!)
        ratingView.settings.starMargin = 10.0
        ratingView.didTouchCosmos = { rating in
            print("touch rating",rating)
            self.ratingStr = "\(rating)"
        }
    }
    
    //MARK: Save ratings to database
    @IBAction func saveRatingAndGo(_ sender: Any) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let formattedDate = formatter.string(from: date)

        saveDataIntoCoreData(rating:self.ratingStr ?? "0" , date: formattedDate)
        CoreDataStore.saveContext()
        self.performSegue(withIdentifier: "goToList", sender: nil)
    }
    
    //MARK: Save Data into Core Data
    func saveDataIntoCoreData(rating:String,date:String) {
        let entity = NSEntityDescription.entity(forEntityName: "RatingsCoreData", in: CoreDataStore.getContext())
        let storeDic = NSManagedObject(entity: entity!, insertInto: CoreDataStore.getContext())

         // Set the data to the entity
         storeDic.setValue(rating, forKey: "rating")
         storeDic.setValue(date, forKey: "dateTime")
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
