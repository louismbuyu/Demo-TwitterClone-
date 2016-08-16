//
//  TimelineTextCell.swift
//  TwitterClone
//
//  Created by Louis Nelson Levoride on 12/08/16.
//  Copyright © 2016 LouisNelson. All rights reserved.
//

import UIKit

class TimelineTextCell: UITableViewCell
{

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var timeStampLbl: UILabel!
    
    @IBOutlet weak var profileName: UILabel!
    
    @IBOutlet weak var postText: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var messageButton: UIButton!
    
    @IBOutlet weak var retweetImage: UIImageView!
    @IBOutlet weak var retweetLbl: UILabel!
    
    @IBOutlet weak var likedImage: UIImageView!
    
    @IBOutlet weak var likedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        profileImage.layer.cornerRadius = 4
        profileImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }

}
