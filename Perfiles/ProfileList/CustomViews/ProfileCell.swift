//
//  ProfileCell.swift
//  Perfiles
//
//  Created by Juan Luis Hernández López on 23/06/23.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var fullAddressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.fullNameLabel.text = nil
        self.emailLabel.text = nil
        self.userNameLabel.text = nil
        self.fullAddressLabel.text = nil
        self.phoneLabel.text = nil
        self.ageLabel.text = nil
        self.nationalityLabel.text = nil
    }
    
    func loadUser(_ user: ProfileUser) {
        self.fullNameLabel.text = user.fullName
        self.emailLabel.text = user.email
        self.userNameLabel.text = user.userName
        self.fullAddressLabel.text = user.location
        self.phoneLabel.text = user.phoneNumber
        self.ageLabel.text = user.age.description
        self.nationalityLabel.text = user.nationality
        
        if let image = user.imageMedium {
            self.pictureImageView.image = image
        }
    }
}
