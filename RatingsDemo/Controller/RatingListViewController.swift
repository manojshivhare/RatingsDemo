//
//  RatingListViewController.swift
//  RatingsDemo
//
//  Created by Manoj Shivhare on 17/04/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import UIKit

class RatingListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var ratingTableView: UITableView!

    var ratingsArr:[CustomRatingModel]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ratingTableView.delegate = self
        self.ratingTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.ratingsArr = CoreDataStore.getAllDataFromStore()
           DispatchQueue.main.async {
               self.ratingTableView.reloadData()
           }
       }

    //MARK: TableView Delegate and DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ratingsArr!.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ratingCell", for: indexPath) as! RatingsTableViewCell
        cell.ratingArrModel = self.ratingsArr![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0;
    }

}
