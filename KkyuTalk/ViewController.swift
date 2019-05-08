//
//  ViewController.swift
//  KkyuTalk
//
//  Created by 배규식 on 17/04/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var idField: UITextField!
    @IBOutlet var pwField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "뀨 톡"
        idField.delegate = self
        pwField.delegate = self
        
        idField.keyboardType = UIKeyboardType.emailAddress
        pwField.keyboardType = UIKeyboardType.emailAddress
        
        
    }

    @IBAction func buttonTouched(_ sender: UIButton) {
        //SIGN UP(회원가입)
        if(sender.tag == 0){
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
        //SIGN IN(로그인)
        if(sender.tag == 1){
            
            
        }
        //USER INFO(회원정보)
        if(sender.tag == 2){
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "UserInfoViewController")
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
    }
}

