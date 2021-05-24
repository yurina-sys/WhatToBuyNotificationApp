//
//  BuyItemListViewController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/04/05.
//

import UIKit
import RxCocoa
import RxSwift

class BuyItemListViewController: UIViewController {

    // 登録ボタン(＋)
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var displayItemSelectButton: UIButton!
    @IBOutlet weak var dateSelectButton: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print("BuyItemListViewController")
    
        self.navigationItem.title = "お買い物リスト"
        // 詳細画面の戻るボタン文字を非表示に
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // 登録ボタン(＋)押下処理
        self.registerButton.rx.tap.subscribe{ [weak self] _ in
            if let inputBuyItemView = R.storyboard.inputBuyItem.inputBuyItem() {
                // 買うものインプット画面（新規登録モード）へ遷移
                self?.present(inputBuyItemView, animated: true, completion: nil)
            }
        }.disposed(by: disposeBag)
    }
}

