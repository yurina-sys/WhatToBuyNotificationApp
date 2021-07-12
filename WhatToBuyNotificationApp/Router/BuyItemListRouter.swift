//
//  BuyItemListRouter.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import Foundation
import UIKit

final class BuyItemListRouter: BuyItemListRouterProtocol {
    var view: BuyItemListViewProtocol?
    
    // 買うもの一覧画面をここで組み立てる
    static func buyItemListViewAssembleModules() -> UIViewController {
        
        let view = BuyItemListViewController.buyItemListViewInstantiate()
        let presenter = BuyItemListPresenter()
        let interactor = BuyItemListInteractor()
        let router = BuyItemListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view

        return view
    }
    
    // 買うもの入力画面へ遷移する
    func gotoInputBuyItemView() {
        let inputBuyItemView = InputBuyItemRouter.assembleModules()
        self.view?.present(inputBuyItemView, animated: true)
    }
    
}
