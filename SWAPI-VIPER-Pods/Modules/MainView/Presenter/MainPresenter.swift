//
//  MainPresenter.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import Foundation

protocol MainPresenterPr: class {
    // Properties
    var router      : MainRouterPr? {get set}
    var view        : MainViewPr? {get set}
    var interactor  : MainInteractorPr? {get set}
    var people      : [ResultModel]? {get set}
    
    // Methods
    func didSelectRow(at indexPath: IndexPath)
}

protocol MainInteractorOutput: class {
    
    // Output from interactor
    func dataFetchedSuccessfully(with people: People)
    func dataFailedToFetch(with error: Error)
    
}


class MainPresenter: MainPresenterPr {
    
    //MARK:- Properties
    var router      : MainRouterPr?
    weak var view   : MainViewPr?
    var interactor  : MainInteractorPr?
    var people      : [ResultModel]?

    //MARK:- Methods
    
    func didSelectRow(at indexPath: IndexPath) {
        print("Did Select row at \(indexPath.row)")
    }

}


extension MainPresenter: MainInteractorOutput {
    // interactor Output
    func dataFetchedSuccessfully(with people: People) {
        // Reload Data
        self.people = people.results
        self.view?.reloadTableViewData()
    }
    
    func dataFailedToFetch(with error: Error) {
        
    }
}
