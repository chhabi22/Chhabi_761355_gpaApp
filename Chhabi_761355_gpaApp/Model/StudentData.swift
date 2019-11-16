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
    var studentID : String
     var studentMarks =  Array(repeating: Array(repeating: 0, count: 5 ), count: 3)

       var studentGPA = Array(repeating: 0.0, count: 3 )

       var studentCGPA: Double
       {

           return (studentGPA[0] + studentGPA[1] + studentGPA[2])/Double(studentGPA.count)
        
       }

 static var studentData = [Student]()
}
