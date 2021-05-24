//
//  BuyItemRegisterViewController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import UIKit
import RxSwift
import RxCocoa

class InputBuyItemViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    // 買うもの入力欄
    @IBOutlet weak var inputBuyItemFIeld: UITextView!
    // カテゴリ入力ボタン
    @IBOutlet weak var inputCategoryButton: UIButton!
    // 数量入力ボタン
    @IBOutlet weak var inputAmountButton: UIButton!
    // お店入力ボタン
    @IBOutlet weak var inputStoreButton: UIButton!
    // 予算入力ボタン
    @IBOutlet weak var inputBudgetButton: UITextField!
    // お知らせ日時入力ボタン
    @IBOutlet weak var inputInformDateButton: UIButton!
    // メモ入力ボタン
    @IBOutlet weak var inputMemoButton: UITextView!
    
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // キャンセルボタン押下時
        self.cancelButton.rx.tap.subscribe { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
        // 登録ボタン押下時
        self.registerButton.rx.tap.subscribe { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
    }
}
