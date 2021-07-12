//
//  InputBuyItemViewProtocols.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/27.
//

import Foundation

// 買うもの入力画面のプロトコルたち
protocol InputBuyItemViewProtocol: TransitionProtocol {
    var presenter: InputBuyItemPresenterProtocol? { get set }
    static func InputBuyItemInstantiate() -> InputBuyItemViewController
    
}

protocol InputBuyItemPresenterProtocol: class {
    var view: InputBuyItemViewProtocol? { get set }
    var interactor: InputBuyItemInteractorProtocol? { get set }
    var router: InputBuyItemRouterProtocol? { get set }
    
    func inputBuyItemViewDismiss()
}

protocol InputBuyItemInteractorProtocol: class {
    var presenter: InputBuyItemPresenterProtocol? { get set }
}

protocol InputBuyItemRouterProtocol: class {
    var view: InputBuyItemViewProtocol? { get set }
    func inputBuyItemViewDismiss()
}
