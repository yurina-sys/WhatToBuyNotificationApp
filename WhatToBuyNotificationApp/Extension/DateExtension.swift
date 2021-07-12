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
}
