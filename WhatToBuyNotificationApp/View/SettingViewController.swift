//
//  SettingViewController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/16.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellNames = ["カテゴリ","お店","初期表示","通知","購入予定日に買えなかったものを繰越表示する","お問い合わせ"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("SettingViewController")
        
        self.navigationItem.title = "設定"
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cellNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "settingCell")
        cell.textLabel?.text = self.cellNames[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
    
    
}
