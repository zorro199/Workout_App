//
//  TabBarController.swift
//  WorkoutApp
//
//  Created by Zaur on 15.02.2023.
//

import UIKit

enum Tabs: Int {
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        tabBar.tintColor = Resourses.Colors.active
        tabBar.barTintColor = Resourses.Colors.inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Resourses.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
        // viewControllers
        let overviewController = OverviewController()
        let sessionController = SessionController()
        let progressController = ProgressController()
        let settingsController = SettingController()
        //set NavigationControllers
        setViewControllers([
        generateNavController(rootViewController: overviewController,
                              title: Resourses.Strings.TabBar.overview,
                              image: Resourses.Images.TabBar.overview,
                              tag: Tabs.overview.rawValue),
        generateNavController(rootViewController: sessionController,
                              title: Resourses.Strings.TabBar.session,
                              image:  Resourses.Images.TabBar.session,
                              tag: Tabs.session.rawValue),
        generateNavController(rootViewController: progressController,
                              title: Resourses.Strings.TabBar.progress,
                              image: Resourses.Images.TabBar.progress,
                              tag: Tabs.progress.rawValue),
        generateNavController(rootViewController: settingsController,
                              title: Resourses.Strings.TabBar.settings,
                              image: Resourses.Images.TabBar.settings,
                              tag: Tabs.settings.rawValue)
        ], animated: false)
    }
    
    private func generateNavController(rootViewController: UIViewController, title: String, image: UIImage, tag: Int) -> UIViewController {
        let navigationVC = NavBarController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        navigationVC.tabBarItem.tag = tag
        return navigationVC
    }
    
}
