//
//  StudentData.swift
//  Chhabi_761355_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

struct Student {
    var firstName : String
    var lastName : String
    var studentID : Int
    var studentGPA = ["MAD3004" : 0.0, "MAD2303" : 0.0, "MAD3463" : 0.0, "MAD3115" : 0.0, "MAD3125" : 0.0]
}
var students = [Student]()
var nerdStudents: [Student] = []
