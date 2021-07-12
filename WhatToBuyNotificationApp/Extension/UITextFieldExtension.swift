//
//  UITextFieldExtension.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/07/10.
//

import Foundation
import UIKit

extension UITextField {
    
    // キーボードに閉じるボタン付きカスタムバーを設定
    func addCustombarOnKeyboard() {
        let custombar = UIView(frame: CGRect(x: 0, y: 0, width: (UIScreen.main.bounds.size.width), height: 40))
        custombar.backgroundColor = .systemGroupedBackground
        
        let closeButton = UIButton(frame: CGRect(x: (UIScreen.main.bounds.size.width)-100, y: 0, width: 100, height: 40))
        closeButton.setTitle("閉じる", for: .normal)
        closeButton.setTitleColor(.blue, for: .normal)
        closeButton.addTarget(self, action: #selector(pushKeyboardCloseButton), for: .touchUpInside)
        custombar.addSubview(closeButton)
        
        self.inputAccessoryView = custombar
        self.keyboardType = .default
    }
    
    @objc private func pushKeyboardCloseButton() {
        self.resignFirstResponder()
    }
    
    func decrateFieldBorder() {
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
    }
    
    
}
