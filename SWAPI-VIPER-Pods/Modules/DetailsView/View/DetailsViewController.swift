//
//  DetailsViewController.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/16/22.
//

import UIKit

protocol DetailsViewPr {
    
    var presenter: DetailsPresenterPr? {get set}
    
}

class DetailsViewController: UIViewController,DetailsViewPr {
    //MARK:- Properties
    var presenter: DetailsPresenterPr?

    //MARK:- Outlets
    
    //MARK:- View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIStyle()

    }
    
    //MARK:- Functions
    func setupUIStyle() {
        title = "Details"
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
}
