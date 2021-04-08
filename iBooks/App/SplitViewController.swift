//
//  SplitViewController.swift
//  iBooks
//
//  Created by ALWIN VARGHESE K on 05/04/2021.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    func splitViewController(_ splitViewController: UISplitViewController,
                    collapseSecondary secondaryViewController: UIViewController,
                    onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
