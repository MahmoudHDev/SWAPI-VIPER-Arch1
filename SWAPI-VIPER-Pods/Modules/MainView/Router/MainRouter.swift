//
//  MainRouter.swift
//  SWAPI-VIPER-Pods
//
//  Created by Mahmoud Hashim on 12/15/22.
//

import UIKit

typealias EntryPoint = MainViewPr & UIViewController

protocol MainRouterPr {
    var entry: EntryPoint? {get set}
    
    static func createModule() -> MainRouterPr
}

class MainRouter: MainRouterPr {
    // MARK:- Properties
    var entry: EntryPoint?
    
    // MARK:- Methods
    static func createModule() -> MainRouterPr  {
        let router = MainRouter()

        let view        : MainViewPr        = MainViewController()
        var interactor  : MainInteractorPr  = MainInteractor()
        let presenter   = MainPresenter()
        
        view.presenter          = presenter
        interactor.presenter    = presenter

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as! MainViewController
        
        return router
    }

}
