//
//  BuyItemListPresenter.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import Foundation

/// 買うものリスト画面Presenter
final class BuyItemListPresenter {
    
    weak var view: BuyItemListViewProtocol?
    var interactor: BuyItemListInteractorProtocol?
    var router: BuyItemListRouterProtocol?
}

extension BuyItemListPresenter: BuyItemListPresenterProtocol {
    func gotoInputItemView() {
        self.router?.gotoInputBuyItemView()
    }
    
}
