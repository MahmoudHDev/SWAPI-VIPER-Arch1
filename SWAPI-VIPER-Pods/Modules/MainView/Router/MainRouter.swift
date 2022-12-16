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
    
    // Create Module
    static func createModule() -> MainRouterPr
    
    // push new viewController
    func pushDetailViewController(on view: MainViewPr, with resultModel: ResultModel)
    
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
    
    // Push new viewController
    func pushDetailViewController(on view: MainViewPr, with resultModel: ResultModel) {
        //instance of the Router
        let detailsRouter = DetailsRouter.createDetailsModule(with: resultModel).entry
        
        let mainViewController = view as! MainViewController
        mainViewController.navigationController?.pushViewController(detailsRouter!, animated: true)
    }
}
