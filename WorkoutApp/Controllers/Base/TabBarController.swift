//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Zaur on 15.02.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}

final class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // You can to call a viewDidLoad
        configure()
        switchTo(tab: .session)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    
    private func configure() {
        tabBar.tintColor = Resourses.Colors.active
        tabBar.barTintColor = Resourses.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resourses.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        //set NavigationControllers
        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: Resourses.Strings.TabBar.title(for: tab),
                                                 image: Resourses.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
    
    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .overview:
            return OverviewController()
        case .session:
            return SessionController()
        case .progress:
            return ProgressController()
        case .settings:
            return SettingController()
        }
    }
}
