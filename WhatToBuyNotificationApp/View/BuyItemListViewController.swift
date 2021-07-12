//
//  BuyItemListViewController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/04/05.
//

import UIKit
import RxCocoa
import RxSwift

/// 買うものリスト画面
class BuyItemListViewController: UIViewController {
    // 登録ボタン(＋)
    @IBOutlet weak var registerButton: UIButton!
    // 表示選択ボタン
    @IBOutlet weak var displayItemSelectButton: UIButton!
    // 表示月選択ボタン
    @IBOutlet weak var dateSelectButton: UIButton!
    
    var presenter: BuyItemListPresenterProtocol?
    let disposeBag = DisposeBag()
    
    /// 自分自身を返す
    static func buyItemListViewInstantiate() -> BuyItemListViewController {
        if let buyItemListView = R.storyboard.buyItemList.buyItemList() {
            // 買うもの一覧画面をrouterに渡す
            return buyItemListView
        }
        return BuyItemListViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BuyItemListViewController")
        
        self.navigationItem.title = "お買い物リスト"
        // 詳細画面の戻るボタン文字を非表示に
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // 登録ボタン(＋)押下処理
        self.registerButton.rx.tap.subscribe{ [weak self] _ in
            
            self?.presenter?.gotoInputItemView()
        }.disposed(by: disposeBag)
    }
}

extension BuyItemListViewController: BuyItemListViewProtocol {
    
}
