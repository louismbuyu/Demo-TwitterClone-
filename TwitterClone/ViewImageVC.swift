//
//  ViewImageVC.swift
//  TwitterClone
//
//  Created by Louis Nelson Levoride on 13/08/16.
//  Copyright © 2016 LouisNelson. All rights reserved.
//

import UIKit

class ViewImageVC: UIViewController {

    @IBOutlet weak var postImage: UIImageView!
    
    var selectedImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        postImage.image = selectedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
