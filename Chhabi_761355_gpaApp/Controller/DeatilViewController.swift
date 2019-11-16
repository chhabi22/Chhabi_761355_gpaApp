//
//  DeatilViewController.swift
//  Chhabi_761355_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class DeatilViewController: UIViewController {
    
    var delMain: StudentMainTableViewController?
    
    
    // outlets of text fields
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var studentIDText: UITextField!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(removeKeyBoard))

        self.view.addGestureRecognizer(tap)
        
    }
    
    
    
    @objc func removeKeyBoard()
    {

        firstNameText.resignFirstResponder()

        lastNameText.resignFirstResponder()

        studentIDText.resignFirstResponder()

    }

    

    
// SAVE BUTTON
    @IBAction func saveTapped(_ sender: UIButton) {
        
        guard self.firstNameText.text != "" && self.lastNameText.text != "" && self.studentIDText.text != "" else
        {
                
            self.oops() ; return
            
        }
            
            // if id is taken - return with proper alert.
            
            for stu in Student.studentData{
                
                if stu.studentID == studentIDText.text {
                    
                 let aC = UIAlertController(title: "Sorry!!", message: "ID: \(studentIDText.text!) is already taken.", preferredStyle: .alert)
                 
                 let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                 
                 aC.addAction(ok)
                 self.present(aC, animated: true, completion: nil)
                    //idTakenAlert()
                    return
                    
                }
                
            }
             let aC = UIAlertController(title: nil, message: "Are you sure ?", preferredStyle: .actionSheet)
                       
                       let n = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
                       let y = UIAlertAction(title: "Yes, I'm Sure!", style: .default, handler: { (action) in
                           
                          
                        let aC = UIAlertController(title: "New Contact Saved", message: "\(self.firstNameText.text!) is now a student.", preferredStyle: .alert)
                                           
                                           let ok = UIAlertAction(title: "OK", style: .cancel, handler: {(action) in
                                               let s = Student(firstName: self.firstNameText.text!, lastName: self.lastNameText.text!, studentID: self.studentIDText.text!)
                           //                let s = Student(first_name: self.firstNameText.text!, last_name: self.lastNameText.text!, id: self.studentIDText.text!)
                                           Student.studentData.append(s)
                                           self.firstNameText.text = ""
                                           self.lastNameText.text = ""
                                           self.studentIDText.text = ""
                                               
                                           })
                                           
                                           aC.addAction(ok)
                                           self.present(aC, animated: true, completion: nil)
                       })
                       aC.addAction(n)
                       aC.addAction(y)
                       self.present(aC, animated: true, completion: nil)
                       
        }
        

           
            
            func oops(){
                
                let aC = UIAlertController(title: nil, message: "Please fill all the details!", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                aC.addAction(ok)
                self.present(aC, animated: true, completion: nil)
                
            }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

