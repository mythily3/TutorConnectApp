//
//  TutorCell.swift
//  TutorConnectApp
//
//  Created by Mythily Kalra on 8/9/25.
//

import UIKit

class TutorCell: UITableViewCell {
    
    @IBOutlet weak var cardView: UIView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var uniLabel: UILabel!
    
    @IBOutlet weak var highSchoolLabel: UILabel!
    
    @IBOutlet weak var subjectsLabel: UILabel!
    
    @IBOutlet weak var payLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2) // How far the shadow is offset
        cardView.layer.shadowRadius = 4.0 // How blurry the shadow is
        cardView.layer.shadowOpacity = 0.12 // How visible the shadow is
        cardView.layer.masksToBounds = false // IMPORTANT: Allows shadow to be visible
        
        payLabel.layer.cornerRadius = 8
        payLabel.backgroundColor = .systemBlue.withAlphaComponent(0.2) // 20% opacity
        // 2. Clip the content to the rounded shape
        payLabel.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
