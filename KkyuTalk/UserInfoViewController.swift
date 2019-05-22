//
//  UserInfoViewController.swift
//  KkyuTalk
//
//  Created by 배규식NICE on 06/05/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

//import UIKit
import RealmSwift


class UserInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var list: Results<Info>?
    let realm = try? Realm()

    @IBOutlet var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "회원 정보"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        // Realm 저장 위치 보여줌
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        //가져온 데이터를 리스트형태로 배치합니다. ID 오른차순으로 정렬합니다.
        list = realm?.objects(Info.self).sorted(byKeyPath: "id", ascending: true)
        self.tableView.reloadData()
        
    }
   
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = list?.count{
            return count
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as! UserInfoTableViewCell
       // cell.idLabel.text = row.id
       // cell.nameLabel.text = row.name
        
        if let db = list?[indexPath.row]{
            cell.idLabel.text = db.id
            cell.nameLabel.text = db.name
            
        }
        
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
