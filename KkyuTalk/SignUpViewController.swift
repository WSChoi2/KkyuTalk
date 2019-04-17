//
//  SignUpViewController.swift
//  KkyuTalk
//
//  Created by 배규식 on 17/04/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewAccessibilityDelegate {
    //let customAccessoryView = CustomAccessoryView.instanceFromNib()
    @IBOutlet var pickerSex: UIPickerView!
    @IBOutlet var idField: UITextField!
    @IBOutlet var pwField: UITextField!
    @IBOutlet var nameField: UITextField!
    
    let values: [String] = ["남성","여성"]
    var userId : String?
    var userName : String?
    var userPassword : String?
    var userSex : String?
    var userBirth : String?
    
    class userInfo {
        var id : String?
        var name : String?
        var password : String?
        var sex : String?
        var birth : String?
    }
    
    
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            self.title = "회원 가입"
        
            idField.delegate = self
            pwField.delegate = self
            nameField.delegate = self
        
            idField.keyboardType = UIKeyboardType.emailAddress
            pwField.keyboardType = UIKeyboardType.emailAddress
            nameField.keyboardType = UIKeyboardType.emailAddress
            idField.returnKeyType = .done
            pwField.returnKeyType = .done
            nameField.returnKeyType = .done
            
        
    }
    
    //키보드 완료 함수
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        
        if(textField == idField){
            userId = idField.text
            print("user ID: \(userId!)")
            pwField.becomeFirstResponder()
        }
        if(textField == pwField){
            userPassword = pwField.text
            print("user PW: \(userPassword!)")
            nameField.becomeFirstResponder()
        }
        
        if(textField == nameField){
            userName = nameField.text
            print("user NAME: \(userName!)")
            view.endEditing(true)
        }
        
        return true
    }
    
    
    //피커뷰 함수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return values[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userSex = values[row]
        print("user SEX: \(userSex!)")
    }
    //데이트 피커
    @IBAction func pickerBirth(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        userBirth = formatter.string(from: datePickerView.date)
        print("user BIRTH: \(userBirth!)")
        
    }
    //가입하기
    @IBAction func signUp(_ sender: Any) {
        
        
        
        let alert = UIAlertController(title: "알림", message: "현재 정보로 가입하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler: {ACTION in self.saveInfo()})
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default, handler: nil)
            
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        

    }
    
    func saveInfo() {
        let aa = userInfo()
        aa.id = userId
        aa.name = userName
        aa.birth = userBirth
        aa.sex = userSex
        aa.password = userPassword
    
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}