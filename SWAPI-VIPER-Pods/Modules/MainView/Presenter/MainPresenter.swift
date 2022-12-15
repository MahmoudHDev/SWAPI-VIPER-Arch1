//
//  MainPresenter.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import Foundation

protocol MainPresenterPr {
    var router      : MainRouterPr? {get set}
    var view        : MainViewPr? {get set}
    var interactor  : MainInteractorPr? {get set}
}

class MainPresenter: MainPresenterPr {
    //MARK:- Properties
    var router      : MainRouterPr?
    var view        : MainViewPr?
    var interactor  : MainInteractorPr?
    //MARK:- Methods

}
