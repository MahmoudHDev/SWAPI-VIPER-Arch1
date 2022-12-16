//
//  DetailsInteractor.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/16/22.
//

import Foundation

protocol DetailsInteractorPr {
    // Properties
    var presenter: DetailsInteractorOutputPr? {get set}
    
    // Methods
    func fetchDataFromPresenter(data: ResultModel)
}

class DetailsInteractor: DetailsInteractorPr {
    //MARK:- Properties
    var presenter: DetailsInteractorOutputPr?
    
    //MARK:- Methods
    func fetchDataFromPresenter(data: ResultModel) {
        // Send data to the output
        self.presenter?.dataFetchedFromInteractor(with: data)
    }

}
