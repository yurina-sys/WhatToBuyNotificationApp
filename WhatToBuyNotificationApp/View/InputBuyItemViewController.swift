//
//  BuyItemRegisterViewController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import UIKit
import RxSwift
import RxCocoa

/// 買うもの登録画面
final class InputBuyItemViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    // 買うもの入力欄
    @IBOutlet weak var inputBuyItemField: UITextField!
    // カテゴリ入力ボタン
    @IBOutlet weak var inputCategoryButton: UIButton!
    // 数量入力ボタン
    @IBOutlet weak var inputAmountButton: UIButton!
    // お店入力ボタン
    @IBOutlet weak var inputStoreButton: UIButton!
    // 予算入力欄
    @IBOutlet weak var inputBudgetField: UITextField!
    // お知らせ日時入力欄
    @IBOutlet weak var inputInformDateField: UITextField!
    // メモ入力ボタン
    @IBOutlet weak var inputMemoField: UITextView!
    
    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!
    var presenter: InputBuyItemPresenterProtocol?
    var datePicker: UIDatePicker?
    var stackViewYFrame = CGFloat()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UIのレイアウト設定
        self.UIConfigure()
        
        // キャンセルボタン押下時
        self.cancelButton.rx.tap.subscribe { [weak self] _ in
            self?.presenter?.inputBuyItemViewDismiss()
        }.disposed(by: disposeBag)
        
        // 登録ボタン押下時
        self.registerButton.rx.tap.subscribe { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
        
        // 買うもの入力フィールド
        self.inputBuyItemFieldConfigureRX()
        // 予算入力欄
        self.inputBudgetFieldConfigureRX()
        // メモ入力view
        self.inputMemoFieldConfigureRX()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.stackViewYFrame = floor(self.stackView.frame.origin.y)
    }
    
    func UIConfigure() {
        // ボーダーつける
        self.inputBuyItemField.decrateFieldBorder()
        self.inputBuyItemField.addCustombarOnKeyboard()
        self.inputMemoField.decrateViewBorder()
        // キーボードに閉じるボタンつける
        self.inputMemoField.addCustombarOnKeyboard()
        // 予算入力欄のキーボードを数字のみに
        self.inputBudgetField.addCustombarOnKeyboard()
        self.inputBudgetField.keyboardType = .numberPad
        
        // DatePicker
        self.datePicker = UIDatePicker()
        self.datePicker?.datePickerMode = .dateAndTime
        self.datePicker?.timeZone = NSTimeZone.local
        self.datePicker?.locale = Locale.current
        self.datePicker?.preferredDatePickerStyle = .wheels
        // 決定バーの生成
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(pushDatepickerCloseButton))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        self.inputInformDateField.inputView = datePicker
        self.inputInformDateField.inputAccessoryView = toolbar
        
    }
    
    // 買う物入力フィールドのRX設定
    func inputBuyItemFieldConfigureRX() {
        // フィールドタップ時
        self.inputBuyItemField.rx.controlEvent(.editingDidBegin).asDriver().drive(onNext: { _ in
            print("走った！")
        }).disposed(by: disposeBag)
        
        // returnボタン押下時（キーボード閉じる）
        self.inputBuyItemField.rx.controlEvent(.editingDidEndOnExit).asDriver().drive(onNext: { _ in
            print("はしった！3")
        }).disposed(by: disposeBag)
        
        // キーボード閉じた時
        self.inputBuyItemField.rx.controlEvent(.editingDidEnd).asDriver().drive(onNext: { _ in
            print("はしった！2")
        }).disposed(by: disposeBag)
        
        
    }
    
    // 予算入力欄のRX設定
    func inputBudgetFieldConfigureRX() {
        // フィールドタップ時
        self.inputBudgetField.rx.controlEvent(.editingDidBegin).asDriver().drive(onNext: { _ in
            print("走った！")
        }).disposed(by: disposeBag)
        
        // returnボタン押下時（キーボード閉じる）
        self.inputBudgetField.rx.controlEvent(.editingDidEndOnExit).asDriver().drive(onNext: { _ in
            print("はしった！3")
        }).disposed(by: disposeBag)
        
        // キーボード閉じた時
        self.inputBudgetField.rx.controlEvent(.editingDidEnd).asDriver().drive(onNext: { _ in
            print("はしった！2")
        }).disposed(by: disposeBag)
        
        
    }
    
    // メモ入力View
    func inputMemoFieldConfigureRX() {
        // viewタップ時
        self.inputMemoField.rx.didBeginEditing.asDriver().drive(onNext: {
            print("走った！5")
        }).disposed(by: disposeBag)
        
        // キーボード閉じた時
        self.inputMemoField.rx.didEndEditing.asDriver().drive(onNext: {
            print("走った！6")
        }).disposed(by: disposeBag)
        
    }
    
    // 購入予定お知らせ日時のDatePickerから日時を受け取る（完了ボタンタップ）
    @objc func pushDatepickerCloseButton() {
        self.inputInformDateField.endEditing(true)
        
        self.inputInformDateField.text = self.datePicker?.date.formatyyyMMddFromDate() ?? ""
    }
    
    // キーボード出現時、viewをあげる
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if !self.inputMemoField.isFirstResponder {
            return
        }
        
        #warning("viewDidLoadでframeを保持してるから、どこかでviewの描画変更されてたらやばい、、？")
        if floor(self.stackView.frame.origin.y) == self.stackViewYFrame {
            if let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.stackView.frame.origin.y -= keyboardRect.height - 90
            }
        }
    }
    
    // viewを戻す
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.stackView.frame.origin.y != self.stackViewYFrame {
            self.stackView.frame.origin.y = self.stackViewYFrame
        }
        
        
        
    }
    
    
    
    static func InputBuyItemInstantiate() -> InputBuyItemViewController {
        if let inputBuyItemView = R.storyboard.inputBuyItem.inputBuyItem() {
            // 買うものインプット画面（新規登録モード）へ遷移
            return inputBuyItemView
        }
        return InputBuyItemViewController()
    }
}

extension InputBuyItemViewController: InputBuyItemViewProtocol {
    
}
