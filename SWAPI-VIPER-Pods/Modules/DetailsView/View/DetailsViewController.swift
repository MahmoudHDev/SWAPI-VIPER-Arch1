//
//  DetailsViewController.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/16/22.
//

import UIKit

protocol DetailsViewPr {
    
    var presenter: DetailsPresenterPr? {get set}
    
    func updateUI(with person: ResultModel)
}

class DetailsViewController: UIViewController {
    //MARK:- Properties
    var presenter: DetailsPresenterPr?

    //MARK:- Outlets
    @IBOutlet weak var genderLabel: UILabel!
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

extension DetailsViewController: DetailsViewPr {
    
    func updateUI(with person: ResultModel) {
        DispatchQueue.main.async {
            self.title = person.name
            self.genderLabel.text = person.gender.rawValue
        }
    }
}
