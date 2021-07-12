//
//  BuyItemRegisterPresenter.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import Foundation

final class InputBuyItemPresenter {
    
    weak var view: InputBuyItemViewProtocol?
    var interactor: InputBuyItemInteractorProtocol?
    var router: InputBuyItemRouterProtocol?
    
}

extension InputBuyItemPresenter: InputBuyItemPresenterProtocol {
    func inputBuyItemViewDismiss() {
        self.router?.inputBuyItemViewDismiss()
    }
}
