//
//  MainInteractor.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import Foundation

protocol MainInteractorPr {
    // Properties
    var presenter: MainInteractorOutput? {get set}
    var resultModel: [ResultModel]? {get set}
    // Methods
    
    func getDataFromNetworkManager()
    func arrPeopleSelectedPerson(at indexPath: IndexPath)
    
}


class MainInteractor: MainInteractorPr {
    
    
    //MARK:- Properties
    var presenter: MainInteractorOutput?
    var resultModel: [ResultModel]?
    
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
                self.resultModel = peopleObj.results
            case .failure(let error):
                self.presenter?.dataFailedToFetch(with: error)
            }
        }
    }
    
    func arrPeopleSelectedPerson(at indexPath: IndexPath)  {
        guard let selectedPerson = resultModel?[indexPath.row] else {return}
        presenter?.pushTheNewVC(with: selectedPerson)
    }

    
}
