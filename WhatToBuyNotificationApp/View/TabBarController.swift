//
//  TabBarController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import Foundation
import UIKit

// タブバーを設定
class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBar()
    }
    
    /// ナビコンを埋め込んだタブバーを作成
    private func setupTabBar() {
        // お買い物リスト画面
        guard let buyItemListVC = UIStoryboard(name: "BuyItemList", bundle: nil).instantiateViewController(withIdentifier: "BuyItemList") as? BuyItemListViewController else {
            return
        }
        let naviconBuyItemList = UINavigationController(rootViewController: buyItemListVC)
        naviconBuyItemList.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        // 設定画面
        guard let settingVC = UIStoryboard(name: "Setting", bundle: nil).instantiateViewController(withIdentifier: "Setting") as? SettingViewController else {
            return
        }
        let naviconSetting = UINavigationController(rootViewController: settingVC)
        naviconSetting.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        setViewControllers([naviconBuyItemList, naviconSetting], animated: false)
    }
}
