//
//  GPAViewController.swift
//  Chhabi_761355_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

class GPAViewController: UIViewController {

    // MARK: Variables
    var audio : AVAudioPlayer!
    var studentIdentity: Int?
    var delGPA: SemTableViewController?
    let claps = ["Win"]
    var totalGPA = 0.0
    var totalCredit = 0.0
    var gpaa = 0.0
    
//MARK: OUTLETS
    
    @IBOutlet var courseLb: [UILabel]!
    @IBOutlet var courseMarks: [UITextField]!
    @IBOutlet weak var gpaLb: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.title = Semester.semData[delGPA!.semIndex]
        
        for course in courseLb.indices {

            courseLb[course].text = Semester.semData[delGPA!.semIndex]
            courseMarks[course].text = String(Student.studentData[delGPA!.stIndex].studentMarks[delGPA!.semIndex][course])

                }

        gpaLb.text! = String(format: "GPA: %.1f / 4", Student.studentData[delGPA!.stIndex].studentGPA[delGPA!.semIndex])
        
        
    }
    
    @IBAction func calculateGPA(_ sender: UIButton) {
        
        
        for c in courseLb.indices {
                   
                
                   let marks = Int(courseMarks[c].text!)
                   
            Student.studentData[delGPA!.stIndex].studentMarks[delGPA!.semIndex][c] = marks!
 
            let g = Double(gpaCalc(grades: marks!))
                       
           let credit = CourceCredit(courseLb[c].text!)
                   
               
                       
                   totalGPA += (g * credit)
                       
                   totalCredit += Double(CourceCredit(courseLb[c].text!))
                   
                   }
                   
                   gpaa = totalGPA/totalCredit
                   
        Student.studentData[delGPA!.stIndex].studentGPA[delGPA!.semIndex] = gpaa
     
                   
               
                   gpaLb.text! = String(format: "GPA: %.2f / 4", (gpaa))
               
                   if gpaa >= 2.8 {
                    
                   let clapURL = Bundle.main.url(forResource: "Win", withExtension: "wav")
        audio = try! AVAudioPlayer(contentsOf: clapURL!)
        audio.play()
    }
                   
               }
        
    
    
    func gpaCalc(grades: Int) -> Double {

    switch grades
        
        {

    case 0...49: return 0.0

    case 50...59: return 1.0

    case 60...62: return 1.7

    case 63...66: return 2.0

    case 67...69: return 2.3

    case 70...72: return 2.7

    case 73...76: return 3.0

    case 77...79: return 3.2

    case 80...86: return 3.5

    case 87...93: return 3.7

    case 94...100: return 4.0

        default: return 0.0

                } // switch end
        
        } // end of calc
    
     func CourceCredit(_ courseName: String) -> Double{
           
           return Double(String(courseName[courseName.index(before: courseName.endIndex)]))!
           
       }
    
    override func viewWillDisappear(_ animated: Bool) {

        delGPA?.tableView.reloadData()

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
