//
//  MainInteractor.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import Foundation

protocol MainInteractorPr {
    
    var presenter: MainPresenterPr? {get set}
    
}

class MainInteractor: MainInteractorPr {
    
    //MARK:- Properties
    var presenter: MainPresenterPr?
    
    //MARK:- Methods
    
}
