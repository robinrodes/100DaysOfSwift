//
//  ViewController.swift
//  Project1
//
//  Created by Robin Rodes on 4/10/19.
//  Copyright © 2019 Robin Rodes. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // INSTANTIATE EMPTY STRING ARRAY FOR PICS
    var pictures = [String]()
    
    // THIS METHOD ESTABLISHES WHAT LOADS (PHOTO NAMES) IN FIRST SCREEN (AKA A TABLEVIEW)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SET TITLE AND MAKE IT LARGE
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // CREATE A FILEMANAGER TO HOLD IMAGES, SET PATH TO THEM AND THEN ACCESS THEM WITH VARIABLE "ITEMS"
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
            // USE LOOP TO GRAB ONLY IMAGES WITH PREFIX NSSL AND STORE THEM IN "PICTURES" STRING ARRAY
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        
        // SORT PHOTO ARRAY ALPHABETICALLY
        pictures.sort()
    }
    
    // THIS METHOD RETURNS (AKA ESTABLISHES) NUMBER OF ROWS IN TABLEVIEW
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    // THIS METHOD DEFINES CELL FOR REUSEABLE PURPOSES IF SCROLL OFFSCREEN. CELL IS WHAT'S RETURNED FOR DISPLAY
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        
        
        var picNumber: Int = -1 // I set variable at xcode instructions; xcode didn't like it being declared ? without value set
       
        for i in 0..<pictures.count  {
            if pictures[indexPath.row] == pictures[i] {
                picNumber = i + 1
            
            }
        }
        //SETS CELL LABEL TEXT
        cell.textLabel?.text = "Picture \(picNumber) of \(pictures.count)"
        return cell
        }
    
    // THIS METHOD PUSHES THE SELECTED IMAGE USER TOUCHED ONTO THE NEXT SCREEN WHERE ITS DISPLAYED
    // NOTE: Detail View Controller file has variable defined "selectedImage", which is grabbed in this method
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

