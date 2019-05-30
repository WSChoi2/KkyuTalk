//
//  ViewController.swift
//  KkyuTalk
//
//  Created by 배규식 on 17/04/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var idField: UITextField!
    @IBOutlet var pwField: UITextField!
    
    var resultCode: String?
    var resultMsg: String?
    
    
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
            //test
            let id = idField.text!
            let pw = pwField.text!
            
            let url = "http://192.168.0.175:3000/users/login"
            let param: Parameters = ["id": id, "pw": pw]
            let alamo = Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.httpBody)
            alamo.responseJSON() { response in
                
                guard let json = response.result.value as? [String: Any],
                        let result = json["result"] as? [String: Any],
                        let code = result["resultCode"] as? String,
                        let msg = result["resultMsg"] as? String else {
                            
                            print("Failed to parse JSON")
                            return
                }
                self.resultCode = code
                self.resultMsg = msg
                
                print("응답코드: \(self.resultCode), 응답메시지: \(self.resultMsg)")
                
                    
                if "001" == self.resultCode {
                    print("로그인 성공")
                    let storyboard: UIStoryboard = self.storyboard!
                    let nextView = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
                    self.navigationController?.pushViewController(nextView, animated: true)
                }else{
                    self.loginFail()
                }
            }

        }
        //USER INFO(회원정보)
        if(sender.tag == 2){
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "UserInfoViewController")
            self.navigationController?.pushViewController(nextView, animated: true)
            
        }
    }
    
    func loginFail(){
        print("로그인 실패")
        let alert = UIAlertController(title: "알림", message: "로그인에 실패하였습니다.\n회원정보를 다시 확인해주세요.", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

