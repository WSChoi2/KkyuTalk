//
//  UserInfo.swift
//  KkyuTalk
//
//  Created by 배규식NICE on 06/05/2019.
//  Copyright © 2019 ksbae1214. All rights reserved.
//

import UIKit
import RealmSwift

class UserInfo: Object {

    var id : String = ""
    var name : String = ""
    var password : String = ""
    var sex : String = ""
    var birth : String = ""
}
