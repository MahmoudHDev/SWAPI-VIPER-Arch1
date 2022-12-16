//
//  DetailsPresenterPr.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/16/22.
//

import Foundation

protocol DetailsPresenterPr {
    var router: DetailsRouterPr?            {get set}
    var view: DetailsViewPr?                {get set}
    var interactor: DetailsInteractorPr?    {get set}
}

class DetailsPresenter: DetailsPresenterPr {
    //MARK:- Properties
    var router: DetailsRouterPr?
    var view: DetailsViewPr?
    var interactor: DetailsInteractorPr?
    
    //MARK:- Methods

}
