//
//  ViewController.swift
//  RatingsDemo
//
//  Created by Manoj Shivhare on 17/04/20.
//  Copyright © 2020 Manoj Shivhare. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var minRatingTF: UITextField!    
    @IBOutlet weak var maxRatingTF: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation

       // In a storyboard-based application, you will often want to do a little preparation before navigation
       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "GoToNext"
           {
               let controller = segue.destination as! SetRatingsViewController
               controller.savedRatings["min"] = Int(minRatingTF.text!)
               controller.savedRatings["max"] = Int(maxRatingTF.text!)
           }
        
       }

    //MARK: GoTo Next View
    @IBAction func GoToNextBtnClick(_ sender: Any) {
        if minRatingTF.text?.count == 0 {
            showAlertWith(title: "Alert!", message: "Please Enter Minimum Ratings")
            return
        }
        else if maxRatingTF.text?.count == 0 {
            showAlertWith(title: "Alert!", message: "Please Enter Maximum Ratings")
            return
        }
        self.performSegue(withIdentifier: "GoToNext", sender: nil)
    }
    
    //MARK: call alert view function
    func showAlertWith(title: String, message: String, style: UIAlertController.Style = .alert) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //MARK: GoTOList
    @IBAction func goToList(_ sender: Any) {
         self.performSegue(withIdentifier: "goToList", sender: nil)
    }
    
}

