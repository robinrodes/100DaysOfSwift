//
//  DetailViewController.swift
//  Project1
//
//  Created by Robin Rodes on 4/10/19.
//  Copyright © 2019 Robin Rodes. All rights reserved.
//

import UIKit

// THIS DETAIL VIEW CONTROLLER LOADS FROM OUR STORYBOARD
class DetailViewController: UIViewController {
    @IBOutlet var ImageView: UIImageView!
    
    // THIS VAR STORES IMAGE FILE NAME RECEIVED FROM TABLEVIEW CONTROLLER OVERRIDE METHOD
    var selectedImage: String?
    
    // THIS METHOD ESTABLISHES WHAT LOADS IN VIEW
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // SET TITLE AND DO NOT MAKE IT LARGE
      title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        // SET DESIRED IMAGE TO LOAD
        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
    }
    
    // METHOD CONTROLS THE NAV BAR APPEARING AT TOP OF VIEW
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    // METHOD CONTROLS THE NAV BAR DISAPPEARING WHEN USER CLICKS PICTURE CELL
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
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
