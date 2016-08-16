//
//  ViewController.swift
//  TwitterClone
//
//  Created by Louis Nelson Levoride on 12/08/16.
//  Copyright © 2016 LouisNelson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tweetArray = [Tweet]()
    var likeConstantOut = false
    var retweetConstant = false
    var likeConstantIn = false
    var selectedImage = UIImage()
    
    var postWasLikedImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 285
        tableView.rowHeight = UITableViewAutomaticDimension
        setupTimeData()
        
        self.title = "Twitter feed"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell1 = tableView.dequeueReusableCellWithIdentifier("cell1") as! TimelineImageCell
        let cell2 = tableView.dequeueReusableCellWithIdentifier("cell2") as! TimelineTextCell
        
        
        
        if let tweetObj:Tweet = self.tweetArray[indexPath.row] {
            
            if let image = tweetObj.postImage{
                
                cell1.preservesSuperviewLayoutMargins = false
                cell1.separatorInset = UIEdgeInsetsZero
                cell1.layoutMargins = UIEdgeInsetsZero
                
                cell1.profileImage.image = tweetObj.profileImage
                cell1.profileName.text = tweetObj.profileName
                
                if let postText = tweetObj.postText
                {
                    cell1.postText.text = postText
                }
                
                if let date = tweetObj.timeStamp
                {
                    cell1.timeStamp.text = simpleDate().date(date)
                }
                
                if let likes = tweetObj.likes{
                    cell1.likedLabel.text = "\(likes)"
                }
                
                if let retweets = tweetObj.retweets{
                    cell1.retweetLbl.text = "\(retweets)"
                }
                
                cell1.postImage.image = image
                
                cell1.likeButton.tag = indexPath.row
                
                cell1.likeButton.addTarget(self, action: #selector(ViewController.likeAction), forControlEvents: UIControlEvents.TouchUpInside)
                
                cell1.retweetButton.tag = indexPath.row
                
                cell1.retweetButton.addTarget(self, action: #selector(ViewController.retweetAction), forControlEvents: UIControlEvents.TouchUpInside)
                
                cell1.selectImageButton.tag = indexPath.row
                
                cell1.selectImageButton.addTarget(self, action: #selector(ViewController.selectedImageAction), forControlEvents: .TouchUpInside)
                
                if let retweets = tweetObj.retweets{
                    cell1.retweetLbl.text = "\(retweets)"
                }
                if let likedByMe = tweetObj.likedbyYou
                {
                    if likedByMe == true{
                        cell1.likedImage.image = UIImage(named: "heartedIcon")
                    }else{
                        cell1.likedImage.image = UIImage(named: "heartIcon")
                    }
                }
                
                if let retweetedByMe = tweetObj.retweetedByYou
                {
                    if retweetedByMe == true{
                        cell1.retweetImage.image = UIImage(named: "retweetedIcon")
                    }else{
                        cell1.retweetImage.image = UIImage(named: "ree")
                    }
                }
                
                return cell1
                
            }else{
                cell2.preservesSuperviewLayoutMargins = false
                cell2.separatorInset = UIEdgeInsetsZero
                cell2.layoutMargins = UIEdgeInsetsZero
                
                cell2.profileImage.image = tweetObj.profileImage
                cell2.profileName.text = tweetObj.profileName
                
                if let postText = tweetObj.postText
                {
                    cell2.postText.text = postText
                }
                
                if let date = tweetObj.timeStamp
                {
                    cell2.timeStampLbl.text = simpleDate().date(date)
                }
                
                if let likes = tweetObj.likes{
                    cell2.likedLabel.text = "\(likes)"
                }
                
                if let retweets = tweetObj.retweets
                {
                    cell2.retweetLbl.text = "\(retweets)"
                }
                
                if let likedByMe = tweetObj.likedbyYou
                {
                    if likedByMe == true{
                        cell2.likedImage.image = UIImage(named: "heartedIcon")
                    }else{
                        cell2.likedImage.image = UIImage(named: "heartIcon")
                    }
                }
                
                if let retweetedByMe = tweetObj.retweetedByYou
                {
                    if retweetedByMe == true{
                        cell2.retweetImage.image = UIImage(named: "retweetedIcon")
                    }else{
                        cell2.retweetImage.image = UIImage(named: "ree")
                    }
                }
                cell2.likeButton.tag = indexPath.row
                cell2.likeButton.addTarget(self, action: #selector(ViewController.likeAction), forControlEvents: UIControlEvents.TouchUpInside)
                cell2.retweetButton.tag = indexPath.row
                cell2.retweetButton.addTarget(self, action: #selector(ViewController.retweetAction), forControlEvents: UIControlEvents.TouchUpInside)
                
                return cell2
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "image_seg"
        {
            let dest = segue.destinationViewController as! ViewImageVC
            dest.selectedImage = self.selectedImage
        }
    }
    
    func selectedImageAction(sender:UIButton)
    {
        if let curr_Obj:Tweet = self.tweetArray[sender.tag]
        {
            
            if let postImage = curr_Obj.postImage
            {
                selectedImage = postImage
                self.performSegueWithIdentifier("image_seg", sender: nil)
            }
        }
    }
    
    func likeAction(sender: UIButton)
    {
        
        if let curr_Obj:Tweet = self.tweetArray[sender.tag]
        {
            if let likedByMe = curr_Obj.likedbyYou
            {
                if likedByMe == true{
                    
                    curr_Obj.likes = curr_Obj.likes! - 1
                    curr_Obj.likedbyYou = false
                    
                }else{
                    curr_Obj.likes = curr_Obj.likes! + 1
                    curr_Obj.likedbyYou = true
                }
            }
            self.tableView.reloadData()
        }
    }
 
    func retweetAction(sender: UIButton)
    {
        if let curr_Obj:Tweet = self.tweetArray[sender.tag]
        {
            
            if let retweetedByMe = curr_Obj.retweetedByYou
            {
                if retweetedByMe == true{
                    curr_Obj.retweets = curr_Obj.retweets! - 1
                    curr_Obj.retweetedByYou = false
                    
                }else{
                    curr_Obj.retweets = curr_Obj.retweets! + 1
                    curr_Obj.retweetedByYou = true
                }
            }
            self.tableView.reloadData()
        }
    }
 
    func setupTimeData(){
 
        let tweet1 = Tweet()
        
        tweet1.likes = 100
        tweet1.retweets = 200
        tweet1.timeStamp = NSDate()
        tweet1.profileName = "Lebron James"
        tweet1.postImage = UIImage(named: "usa")
        tweet1.profileImage = UIImage(named: "lebron")
        tweet1.likedbyYou = false
        tweet1.retweetedByYou = false
        
        let tweet2 = Tweet()
        
        tweet2.likes = 100
        tweet2.retweets = 200
        tweet2.postText = "I don't know what I'm going to do tomorrow. I just know for sure I'm going to keep playing basketball."
        tweet2.timeStamp = NSDate()
        tweet2.postImage = UIImage(named: "usa2")
        tweet2.profileName = "Kevin Durant"
        tweet2.profileImage = UIImage(named: "kevin")
        tweet2.likedbyYou = false
        tweet2.retweetedByYou = false
        
        let tweet3 = Tweet()
        
        tweet3.likes = 100
        tweet3.retweets = 200
        tweet3.postText = "I love this game!!!!!"
        tweet3.timeStamp = NSDate()
        tweet3.profileName = "Kylie Irving"
        tweet3.profileImage = UIImage(named: "irving")
        tweet3.likedbyYou = false
        tweet3.retweetedByYou = false
        
        let tweet4 = Tweet()
        
        tweet4.likes = 100
        tweet4.retweets = 200
        tweet4.postText = "Make your supporters proud and your haters jealous."
        tweet4.timeStamp = NSDate()
        tweet4.profileName = "Klay Thompson"
        tweet4.profileImage = UIImage(named: "klay")
        tweet4.likedbyYou = false
        tweet4.retweetedByYou = false
        
        let tweet5 = Tweet()
        
        tweet5.likes = 100
        tweet5.retweets = 200
        tweet5.postText = "There is a lot of pressure put on me, but I don't put a lot of pressure on myself. I feel if I play my game, it will take care of itself."
        tweet5.timeStamp = NSDate()
        tweet5.profileName = "Steph Curry"
        tweet5.profileImage = UIImage(named: "steph")
        tweet5.likedbyYou = true
        tweet5.retweetedByYou = true
        
        let tweet6 = Tweet()
        
        tweet6.likes = 100
        tweet6.retweets = 200
        tweet6.postText = "In any situation i'm going to be good!"
        tweet6.timeStamp = NSDate()
        tweet6.postImage = UIImage(named: "hard")
        tweet6.profileName = "James harden"
        tweet6.profileImage = UIImage(named: "james")
        tweet6.likedbyYou = false
        tweet6.retweetedByYou = false
        
        self.tweetArray.append(tweet1)
        self.tweetArray.append(tweet2)
        self.tweetArray.append(tweet3)
        self.tweetArray.append(tweet4)
        self.tweetArray.append(tweet5)
        self.tweetArray.append(tweet6)
        
        self.tableView.reloadData()
        
    }


}

