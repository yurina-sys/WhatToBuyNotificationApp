//
//  BuyItemRegisterRouter.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import UIKit

final class InputBuyItemRouter {
    
    weak var view: InputBuyItemViewProtocol?
    
    // 買うもの入力画面をここで組み立てる
    static func assembleModules() -> UIViewController {
        
        let view = InputBuyItemViewController.InputBuyItemInstantiate()
        let presenter = InputBuyItemPresenter()
        let interactor = InputBuyItemInteractor()
        let router = InputBuyItemRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.view = view

        return view
    }
}

extension InputBuyItemRouter: InputBuyItemRouterProtocol {
    // 画面閉じる（買いものリスト画面へ）
    func inputBuyItemViewDismiss() {
        self.view?.dismiss(animated: true, completion: nil)
    }
}
