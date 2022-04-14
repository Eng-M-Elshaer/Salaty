//
//  TabBarVC.swift
//  Salaty
//
//  Created by Mohamed Elshaer on 7/9/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import UIKit

class TabBarVC: UITabBarController {

    // MARK: - Properties
    let mainNavigation = UINavigationController()
    let settingNavigation = UINavigationController()

    // MARK:- Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers()
        setupTabBarView()
    }
}

// MARK:- Private Methods
extension TabBarVC {
    private func setupTabBarView(){
        tabBar.barTintColor = .lightBlue
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 10
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
    }
    private func setSettingTab() {
        let settingVC = SettingVC.create()
        settingVC.tabBarItem.image = Asset.settingWhiteTab.image.withRenderingMode(.alwaysOriginal)
        settingVC.tabBarItem.selectedImage = Asset.settingPurpleTab.image.withRenderingMode(.alwaysOriginal)
        settingNavigation.viewControllers = [settingVC]
    }
    private func setMainTab() {
        let mainVC = MainVC.create()
        mainVC.tabBarItem.image = Asset.homeWhiteTab.image.withRenderingMode(.alwaysOriginal)
        mainVC.tabBarItem.selectedImage = Asset.homePurpleTab.image.withRenderingMode(.alwaysOriginal)
        mainNavigation.viewControllers = [mainVC]
    }
    private func setViewControllers() {
        setSettingTab()
        setMainTab()
        self.viewControllers = [mainNavigation, settingNavigation]
        self.selectedIndex = 0
        for vc in self.viewControllers! {
            vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        }
    }
}
