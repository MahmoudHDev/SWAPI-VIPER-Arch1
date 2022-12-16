//
//  DetailsRouter.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/16/22.
//

import UIKit

typealias DetailsEntryPoint = UIViewController & DetailsViewPr

protocol DetailsRouterPr {
    var entry: DetailsEntryPoint? {get}
    
    static func createDetailsModule(with data: ResultModel) -> DetailsRouterPr
}

class DetailsRouter: DetailsRouterPr {
    // MARK:- Properties
    var entry: DetailsEntryPoint?
    
    // MARK:- Methods
    static func createDetailsModule(with data: ResultModel) -> DetailsRouterPr {
        let router     = DetailsRouter()
        
        let view = UIStoryboard(name: "DetailsView", bundle: nil).instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        let presenter: DetailsPresenter     = DetailsPresenter()
        var interactor: DetailsInteractorPr = DetailsInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as DetailsEntryPoint
        
        return router
    }

    
    
}
