//
//  LocalReviewsViewController.swift
//  Eye-Notebook0
//
//  Created by Sri Harsha on 16/01/20.
//  Copyright © 2020 Sri Harsha. All rights reserved.
//
import Foundation
import UIKit
import FirebaseDatabase
import Firebase
class LocalReviewsViewController: UIViewController, UITableViewDelegate {
    var ref: DatabaseReference!
        
    var list :[PatientsList] = [
     PatientsList(patientId: "abcde", body: "harsha"),
     PatientsList(patientId: "abcde", body: "harsh"),
     PatientsList(patientId: "abcde", body: "hars")
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LocalReviews"
        patientsTable.dataSource = self
        patientsTable.delegate = self
        
        patientsTable.register(UINib(nibName: "ListCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        ref = Database.database().reference().child("PatientsProfile").child("sriharsha")
        
        
        loadList()
        // Do any additional setup after loading the view.
    }
    
    func loadList(){
        
    }
    
    @IBOutlet weak var patientsTable: UITableView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
       func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // go to show patients review details that are retrived from database by performing segues
        performSegue(withIdentifier: "goToReview", sender: self)

       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension LocalReviewsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        as! ListCell
        cell.idLabel.text = list[indexPath.row].patientId
        cell.bodyLabel.text = list[indexPath.row].body
        return cell
    }
    
    
}





