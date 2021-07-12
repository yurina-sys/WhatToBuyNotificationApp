//
//  TabBarController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

// タブバーを設定
class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
        
    }
    
    /// ナビコンを埋め込んだタブバーを作成
    private func setupTabBar() {
        // ナビコンに埋め込んだ買うものリスト画面を生成
        let naviconBuyItemList = UINavigationController(rootViewController: BuyItemListRouter.buyItemListViewAssembleModules())
        naviconBuyItemList.navigationItem.backBarButtonItem = UIBarButtonItem(image: UIImage(named: "back_arrow_icom"), style: .plain, target: self, action: nil)
        naviconBuyItemList.tabBarItem = UITabBarItem(title: "買うもの", image: nil, tag: 0)
        
        // 設定画面
        guard let settingVC = UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: "Setting") as? SettingViewController else {
            return
        }
        let naviconSetting = UINavigationController(rootViewController: settingVC)
        naviconSetting.tabBarItem = UITabBarItem(title: "設定", image: nil, tag: 1)
        
        setViewControllers([naviconBuyItemList, naviconSetting], animated: false)
    }
}
