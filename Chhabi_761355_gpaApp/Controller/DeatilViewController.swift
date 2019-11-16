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

    }
    
  
 
// SAVE BUTTON
    @IBAction func saveTapped(_ sender: UIButton) {
        
        guard self.firstNameText.text != "" && self.lastNameText.text != "" && self.studentIDText.text != "" else
        {
                
            self.oops() ; return
            
        }
            // CHECK same ID
            
            for stu in Student.studentData{
                
                if stu.studentID == studentIDText.text {
                    
                let idAlert = UIAlertController(title: "Sorry!!", message: "ID: \(studentIDText.text!) is already taken.", preferredStyle: .alert)
                              
                              let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                              
                              idAlert.addAction(ok)
                              self.present(idAlert, animated: true, completion: nil)
                 return
                }
                
            }
             // save
         let sAlert = UIAlertController(title: nil, message: "Are you sure ?", preferredStyle: .actionSheet)
                      
                      let n = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
                      let y = UIAlertAction(title: "Yes, I'm Sure!", style: .default, handler: { (action) in
                          
                         
                          self.contactSavedAlert()
                          
                      })
                      sAlert.addAction(n)
                      sAlert.addAction(y)
                      self.present(sAlert, animated: true, completion: nil)
        
    }
        


               func contactSavedAlert(){
                   
                   let contactAlert = UIAlertController(title: "New Contact Saved", message: "\(firstNameText.text!) is now a student.", preferredStyle: .alert)
                   
                   let ok = UIAlertAction(title: "OK", style: .cancel, handler: {(action) in
                   let s = Student(firstName: self.firstNameText.text!, lastName: self.lastNameText.text!, studentID: self.studentIDText.text!)
                   Student.studentData.append(s)
                   self.firstNameText.text = nil
                   self.lastNameText.text = nil
                   self.studentIDText.text = nil
                       
                   })
                   
                   contactAlert.addAction(ok)
                   self.present(contactAlert, animated: true, completion: nil)
               }
            func oops(){
                
                let oopsAlert = UIAlertController(title: "OOPS!!", message: "Please fill all the Fields!", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                oopsAlert.addAction(ok)
                self.present(oopsAlert, animated: true, completion: nil)
                
            }
    override func viewWillDisappear(_ animated: Bool) {
        
        
        delMain?.updateStudent()
        
        
    }
    
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

