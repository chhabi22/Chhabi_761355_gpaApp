//
//  DeatilViewController.swift
//  Chhabi_761355_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class DeatilViewController: UIViewController {
    
    // outlets of text fields
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var studentIDText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
// SAVE BUTTON
    @IBAction func saveTapped(_ sender: UIButton) {
        if firstNameText.text != "" && lastNameText.text != "" && studentIDText.text != "" {
            if students.first(where: {$0.studentID == Int(studentIDText.text!)}) == nil {
// Save ALERT
                let saveAlert = UIAlertController(title: "Save", message: "Are you sure?", preferredStyle: .alert)
                
                
                let yesBtn = UIAlertAction(title: "Yes, I'm Sure!", style: .default, handler: { (ACTION) in
                    students.append(Student(firstName: self.firstNameText!.text!, lastName: self.lastNameText.text!, studentID: Int(self.studentIDText.text!)!))
                    
// CONTACT SAVE ALERT
                let detailSavedAlert = UIAlertController(title: "New Contact Saved", message: "\(self.firstNameText!.text!) is now a student.", preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "OK", style: .cancel)
                    detailSavedAlert.addAction(okBtn)
                self.present(detailSavedAlert, animated: true, completion: nil)
                self.lastNameText.text = nil
                self.firstNameText.text = nil
                self.studentIDText.text = nil
                self.firstNameText.resignFirstResponder()
                self.lastNameText.resignFirstResponder()
                self.studentIDText.resignFirstResponder()                })
                //no way ALERT
                let noBtn = UIAlertAction(title: "No Way!", style: .cancel)

  // ACTIONS
                saveAlert.addAction(yesBtn)
                saveAlert.addAction(noBtn)
                
                self.present(saveAlert, animated: true, completion: nil)
                
            } else {
                
   // IDENTICAL STUDENT NAME ALERT
                let identicalStudent = UIAlertController(title: "Student Already Exists! ", message: "Give another ID", preferredStyle: .alert)
                let okBtn = UIAlertAction(title: "OK", style: .cancel)

               identicalStudent.addAction(okBtn)
                self.present(identicalStudent, animated: true, completion: nil)
            }
        } else {
  // empty ALERT
            let emptyAlert = UIAlertController(title: "Sorry!", message: "Please fill all the fields.", preferredStyle: .alert)
            let okBtn = UIAlertAction(title: "OK", style: .cancel)
            
    // ACTION
            emptyAlert.addAction(okBtn)
            self.present(emptyAlert, animated: true, completion: nil)
        }
    }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

