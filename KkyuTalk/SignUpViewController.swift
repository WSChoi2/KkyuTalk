//
//  SignUpViewController.swift
//  KkyuTalk
//
//  Created by 배규식 on 17/04/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

import Realm
import RealmSwift
import Alamofire
import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewAccessibilityDelegate {
    //let customAccessoryView = CustomAccessoryView.instanceFromNib()
    @IBOutlet var pickerSex: UIPickerView!
    @IBOutlet var idField: UITextField!
    @IBOutlet var pwField: UITextField!
    @IBOutlet var nameField: UITextField!
    
    let values: [String] = ["남성","여성"]
    var userSex : String?
    var userBirth : String?
    let realm = try? Realm()
    
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
            pwField.becomeFirstResponder()
        }
        if(textField == pwField){
            nameField.becomeFirstResponder()
        }
        if(textField == nameField){
            view.endEditing(true)
        }
        
        return true
    }
    
    //화면 탭하면 키보드 내리기 함수
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
        
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
    }
    //데이트 피커
    @IBAction func pickerBirth(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        
        userBirth = formatter.string(from: datePickerView.date)
        
    }
    
    func saveNewUser(){
        
        /*
        let user = Info()
        user.id = idField.text!
        user.name = nameField.text!
        user.password = pwField.text!
        user.sex = userSex!
        user.birth = userBirth!
        let realm = try? Realm()

        try? realm?.write {
            realm?.add(user)
        }
        print("save INFO: \(user.id)")
        */
        
        
        let url = "http://192.168.1.100:3000/users/register"
        let id = idField.text!
        let pw = pwField.text!
        let profilePath = nameField.text!
        let param: Parameters = ["id": id, "pw": pw, "profilePath": profilePath]
        
        let alamo = Alamofire.request(url, method: .post, parameters: param, encoding: URLEncoding.httpBody)
        
        print("회원정보 서버에 저장 id: \(idField.text!), pw: \(pwField.text!)")
        
        alamo.responseJSON() { response in
            //print("RESULT JSON: \(response.result.value!)")
            
            if let jsonObject = response.result.value as? [String: Any] {
                print("result: \(jsonObject["result"]!)")
                
                
            }
        }
        
        

    }
    
    
    //가입하기
    @IBAction func signUp(_ sender: Any) {
        
        let alert = UIAlertController(title: "알림", message: "현재 정보로 가입하시겠습니까?", preferredStyle: UIAlertController.Style.actionSheet)
        let okAction = UIAlertAction(title: "확인",
                                     style: UIAlertAction.Style.default,
                                     handler: {
                                        ACTION in
                                        self.saveNewUser()
                                        self.navigationController?.popViewController(animated: true)
                                        
        })
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertAction.Style.default, handler: nil)
            
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        

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


