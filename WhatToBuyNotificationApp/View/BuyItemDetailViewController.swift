//
//  BuyItemDetailViewController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import UIKit

class BuyItemDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "ボディクリーム"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("test", comment: ""), style: .plain, target: self, action: #selector(self.presentInputItemVC))
        
    }
    
    // 買うものインプット画面（編集モード）へ遷移
    @objc func presentInputItemVC() {
        if let presentItemVC = R.storyboard.inputBuyItem.inputBuyItem() {
            
            present(presentItemVC, animated: true, completion: nil)
        }
    }
    
    
}
