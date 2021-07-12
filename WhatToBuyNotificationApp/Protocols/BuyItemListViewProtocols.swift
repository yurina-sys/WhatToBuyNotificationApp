//
//  BuyItemListViewProtocols.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/27.
//

import Foundation

// 買うもの一覧画面のプロトコルたち
protocol BuyItemListViewProtocol: TransitionProtocol {
    var presenter: BuyItemListPresenterProtocol? { get set }
    static func buyItemListViewInstantiate() -> BuyItemListViewController
}

protocol BuyItemListPresenterProtocol: class {
    var view: BuyItemListViewProtocol? { get set }
    var interactor: BuyItemListInteractorProtocol? { get set }
    var router: BuyItemListRouterProtocol? { get set }
    
    // 買うもの入力画面へ遷移する
    func gotoInputItemView()
}

protocol BuyItemListInteractorProtocol: class {
    var presenter: BuyItemListPresenterProtocol? { get set }
}

protocol BuyItemListRouterProtocol: class {
    var view: BuyItemListViewProtocol? { get set }
    
    func gotoInputBuyItemView()
}
