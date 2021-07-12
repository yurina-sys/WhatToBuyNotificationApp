//
//  UIDatePickerExtension.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/07/10.
//

import Foundation
import UIKit

extension UIDatePicker {
    
    func assembleView(UIViewController: UIViewController) -> UIView {
        self.datePickerMode = .dateAndTime
        self.timeZone = NSTimeZone.local
        self.locale = Locale.current
        self.preferredDatePickerStyle = .wheels
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIViewController.view.frame.width, height: UIViewController.view.frame.height / 3)
        view.addSubview(self)
        return view
    }
}
