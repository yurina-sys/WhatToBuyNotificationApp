//
//  DateExtension.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/07/12.
//

import Foundation

extension Date {
    
    func formatyyyMMddFromDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日 HH:mm"
        
        return formatter.string(from: self)
    }
    
    /// 現在時刻の取得（完全系）
    func getNowDateTimeCompleteness() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSZ"
        return formatter.string(from: Date())
    }
}
