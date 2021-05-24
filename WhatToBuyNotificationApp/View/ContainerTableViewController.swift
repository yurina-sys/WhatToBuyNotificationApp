//
//  CotainerTableViewController.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/17.
//

import UIKit


class ContainerTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "BuyListTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // cellの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        // お買い物詳細画面へ遷移
        if let detailVC = R.storyboard.buyItemDetail.buyItemDetail() {
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? BuyListTableViewCell {
            cell.accessoryType = .disclosureIndicator
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }



}
