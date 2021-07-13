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
    
    private var buyItemInfo = BuyItemInfo()
    // 買うもの情報
//    var buyItemInfo = BuyItemInfo()
    
}

extension InputBuyItemPresenter: InputBuyItemPresenterProtocol {
    func setBuyItemCategory(category: String?) {
        self.buyItemInfo.buyItemCategory = category
    }
    
    func setBuyItemCount(count: Int?) {
        self.buyItemInfo.buyItemCount = count
    }
    
    func setBuyItemShop(shopName: String?) {
        self.buyItemInfo.buyItemShop = shopName
    }
    
    func setBuyItemBudget(budget: Int?) {
        self.buyItemInfo.buyItemBudget = budget
    }
    
    func setBuyItemNotificationDate(date: Date?) {
        self.buyItemInfo.buyItemNotificationDate = date
    }
    
    func setBuyItemName(name: String?) {
        self.buyItemInfo.buyItemName = name
    }
    
    func setBuyItemMemo(memo: String?) {
        self.buyItemInfo.buyItemMemo = memo
    }
    
    func inputBuyItemViewDismiss() {
        self.router?.inputBuyItemViewDismiss()
    }
    
    func registerBuyItemInfo() {
        LogOutput.log("買うもの情報登録処理開始、\n buyItemInfo = \(self.buyItemInfo)")
    }
}
