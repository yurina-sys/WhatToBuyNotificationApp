//
//  BuyItemInfo.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/07/13.
//

import Foundation

struct BuyItemInfo {
    // 買うもの
    var buyItemName: String?
    // カテゴリ
    var buyItemCategory: String?
    // 個数
    var buyItemCount: Int?
    // お店
    var buyItemShop: String?
    // 予算
    var buyItemBudget: Int?
    // 購入お知らせ日時
    var buyItemNotificationDate: Date?
    // メモ
    var buyItemMemo: String?
}
