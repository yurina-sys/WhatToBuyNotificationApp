//
//  TransitionProtocol.swift
//  WhatToBuyNotificationApp
//
//  Created by 齋藤百合奈 on 2021/05/27.
//

import Foundation
import UIKit

/// 全てのUIViewControllerに継承させるやつ
protocol TransitionProtocol: class {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)
    func popToViewController(_ viewController: UIViewController, animated: Bool)
    func popToRootViewController(animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool)
    func dismiss(animated: Bool, completion: (() -> Void))
    func dismiss(animated: Bool, completion: (() -> Void)?)
}

extension TransitionProtocol where Self: UIViewController {
    
    func pushViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    func popViewController(animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.popViewController(animated: animated)
    }
    
    func popToViewController(_ viewController: UIViewController, animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.popToViewController(viewController, animated: animated)
    }
    
    func popToRootViewController(animated: Bool) {
        guard let navigationController = self.navigationController else {
            return
        }
        navigationController.popToRootViewController(animated: animated)
    }
    
    func present(_ viewController: UIViewController, animated: Bool) {
        self.present(viewController, animated: animated)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)) {
        self.dismiss(animated: animated, completion: completion)
    }
}
