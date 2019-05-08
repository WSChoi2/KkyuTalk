//
//  Info.swift
//  KkyuTalk
//
//  Created by 배규식 on 08/05/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

import UIKit
import RealmSwift

class Info: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var password = ""
    @objc dynamic var sex = ""
    @objc dynamic var birth = ""
    
}
