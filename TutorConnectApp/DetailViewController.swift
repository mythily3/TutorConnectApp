//
//  DetailViewController.swift
//  TutorConnectApp
//
//  Created by Mythily Kalra on 8/9/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var picImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var uniLabel: UILabel!
    
    @IBOutlet weak var highSchoolLabel: UILabel!
    
    @IBOutlet weak var bioLabel: UILabel!
    
    @IBOutlet weak var subjectsLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var availabilityLabel: UILabel!
    
    @IBOutlet weak var payLabel: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func didTapFavoriteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            tutor.addToFavorites()
        } else {
            tutor.removeFromFavorites()
        }
    }
    var tutor: Tutor!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //TODO: favoriteButton.layer.cornerRadius = favoriteButton.frame
        nameLabel.text = tutor.name
        locationLabel.text = tutor.location
        uniLabel.text = tutor.university
        highSchoolLabel.text = tutor.highSchool
        bioLabel.text = tutor.bio
        var subjectsString = " "
        for s in tutor.subjects {
            if s == tutor.subjects.last {
                subjectsString += s
            }
            else {
                subjectsString += s + ", "
            }
        }
        subjectsLabel.text = subjectsString
        emailLabel.text = tutor.email
        phoneLabel.text = tutor.phone
        availabilityLabel.text = tutor.availability
        payLabel.text = "  $\(tutor.payRate)/hr  "
        
        let favorites = Tutor.getTutors(forKey: Tutor.favoritesKey)
        //TODO: fix below lines
//        if favorites.contains(tutor) {
//            favoriteButton.isSelected = true
//        }
//        else {
//            favoriteButton.isSelected = false
//        }
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
