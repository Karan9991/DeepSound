//
//  Followers-TableCell.swift
//  DeepSoundiOS
//
//  Created by Macbook Pro on 03/07/2019.
//  Copyright © 2019 Muhammad Haris Butt. All rights reserved.
//

import UIKit

class Followers_TableCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var followingBtn: UIButton!
    
    var vc:FollowersVC?
    var artistVC:ArtistVC?
    var delegate : followUserDelegate?
    var indexPath:Int? = 0
    var status:Bool? = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    @IBAction func followPressed(_ sender: Any) {
        if AppInstance.instance.getUserSession(){
            self.status = !status!
                   if self.status!{
                       self.delegate?.followUser(index: indexPath ?? 0, button: self.followingBtn,status:self.status!)
                   }else{
                       self.delegate?.followUser(index: indexPath ?? 0, button: self.followingBtn,status:self.status!)
                   }
        }else{
            if self.artistVC != nil{
                let vc = R.storyboard.popups.loginPopupVC()
                self.artistVC?.present(vc!, animated: true, completion:   nil)
            }else{
                let vc = R.storyboard.popups.loginPopupVC()
                self.vc?.present(vc!, animated: true, completion:   nil)
            }
           
        }
       
    }
}
