//
//  TimelineImageCell.swift
//  TwitterClone
//
//  Created by Louis Nelson Levoride on 12/08/16.
//  Copyright © 2016 LouisNelson. All rights reserved.
//

import UIKit

class TimelineImageCell: UITableViewCell
{

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var timeStamp: UILabel!
    
    @IBOutlet weak var postImage: UIImageView!
    
    @IBOutlet weak var postText: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var retweetImage: UIImageView!
    @IBOutlet weak var retweetLbl: UILabel!
    
    @IBOutlet weak var likedImage: UIImageView!
    
    @IBOutlet weak var likedLabel: UILabel!
    
    @IBOutlet weak var selectImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postImage.layer.cornerRadius = 5
        postImage.clipsToBounds = true
        
        profileImage.layer.cornerRadius = 4
        profileImage.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
