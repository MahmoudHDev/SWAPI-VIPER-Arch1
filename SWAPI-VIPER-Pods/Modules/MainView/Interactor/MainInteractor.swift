//
//  MainInteractor.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import Foundation

protocol MainInteractorPr {
    
    var presenter: MainInteractorOutput? {get set}
        
    func getDataFromNetworkManager()
}


class MainInteractor: MainInteractorPr {
    
    
    //MARK:- Properties
    var presenter: MainInteractorOutput?
    
    let networkManager: NetworkManager = NetworkManager()
    //MARK:- Init
    init() {
        getDataFromNetworkManager()
    }
    
    //MARK:- Methods
    func getDataFromNetworkManager() {
        // The networkManager.getData will be called from
        networkManager.getData { (fetchedData) in
            switch fetchedData {
            case .success(let peopleObj):
                self.presenter?.dataFetchedSuccessfully(with: peopleObj)
            case .failure(let error):
                self.presenter?.dataFailedToFetch(with: error)
            }
        }
    }
}
