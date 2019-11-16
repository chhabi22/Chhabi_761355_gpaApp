//
//  StudentMainTableViewController.swift
//  Chhabi_761355_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentMainTableViewController: UITableViewController, UISearchBarDelegate {
    //MARK: Variables
    var stIndex = -1
    var Data = [String]()
    var nerdStuData = [String]() //filterd
    
    //MARK: Outlets
   
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// searchController.searchResultsUpdater = self
//
// searchController.dimsBackgroundDuringPresentation = false
//
// definesPresentationContext = true
//
//    tableView.tableHeaderView = searchController.searchBar

    }


    
// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Student.studentData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // recycle cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
      
        // show student name on the label
        cell.textLabel?.text = "\(Student.studentData[indexPath.row].firstName) \(Student.studentData[indexPath.row].lastName)"
        return cell
    }
    
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

  
// MARK: - Navigation

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
 {
       
    if let detail = segue.destination as? DeatilViewController
    {
        detail.delMain = self
    }
    if let sem = segue.destination as? SemTableViewController
    {
        sem.delMain = self
        if let cell = sender as? UITableViewCell{
            
            stIndex = tableView.indexPath(for: cell)!.row
            
        }
        
    }
                                    
} // END OF PREPARE SEGUE
    
} //End of class
//if (segue.identifier == "gpa") {
//
//let destinationVC = segue.destination as! GPAViewController
//if let tableViewCell = sender as? UITableViewCell
//{
//if let index = tableView.indexPath(for: tableViewCell)?.row
//   {
//    destinationVC.studentIdentity = Student.studentData[indexp].studentID
//    }
//}
