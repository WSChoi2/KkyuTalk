//
//  UserInfoViewController.swift
//  KkyuTalk
//
//  Created by 배규식NICE on 06/05/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

import UIKit
import RealmSwift


class UserInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list: Results<UserInfo>?
    var realm : Realm!
    var dataSource = Array<String>()
    
    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "회원 가입"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupRealm()
        
    }
    
    func setupRealm(){
        try! realm = Realm()
        
        func updateList(){
            if list == nil{
                list = self.realm.objects(UserInfo.self)
            }
            self.tableView.reloadData()
        }
        updateList()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = list![indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as! UserInfoTableViewCell
        cell.idLabel.text = row.id
        cell.nameLabel.text = row.name
        
        return cell
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
