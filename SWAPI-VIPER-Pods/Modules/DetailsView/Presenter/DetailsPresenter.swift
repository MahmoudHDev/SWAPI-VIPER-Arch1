//
//  DetailsPresenterPr.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/16/22.
//

import Foundation

protocol DetailsPresenterPr {
    // Properties
    var router: DetailsRouterPr?            {get set}
    var view: DetailsViewPr?                {get set}
    var interactor: DetailsInteractorPr?    {get set}
    
    // Methods
    func dataFetchedFromMain(with person: ResultModel)
}

protocol DetailsInteractorOutputPr {
    // interactor Output
    func dataFetchedFromInteractor(with person: ResultModel)
}

class DetailsPresenter: DetailsPresenterPr {
    //MARK:- Properties
    var router: DetailsRouterPr?
    var view: DetailsViewPr?
    var interactor: DetailsInteractorPr?
    
    //MARK:- Methods
    func dataFetchedFromMain(with person: ResultModel) {
        self.interactor?.fetchDataFromPresenter(data: person)
    }

}

extension DetailsPresenter :DetailsInteractorOutputPr {
    
    
    // MARK:- Methods
    func dataFetchedFromInteractor(with person: ResultModel) {
        self.view?.updateUI(with: person)
    }

}
