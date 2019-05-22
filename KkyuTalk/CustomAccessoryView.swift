//
//  CustomAccessoryView.swift
//  KkyuTalk
//
//  Created by 배규식 on 17/04/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

import UIKit

class CustomAccessoryView: UIView {

    @IBOutlet weak var quitButton: UIButton!
    
    class func instanceFromNib() -> CustomAccessoryView{
        return UINib(nibName: "CustomAccessoryView", bundle: nil).instantiate(withOwner: nil, options: nil).first as! CustomAccessoryView
        
    }
    //
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
