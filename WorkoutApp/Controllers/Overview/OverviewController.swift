//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Zaur on 15.02.2023.
//

import UIKit
import SnapKit

class OverviewController: BaseController {
    
    private let navBar = OverViewNavBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resourses.Strings.TabBar.overview
    }

}

extension OverviewController {
    override func addViews() {
        super.addViews()
        view.addSubviews([navBar])
    }
    
    override func layoutViews() {
        super.layoutViews()
        navBar.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(115)
        }
    }
    
    override func configure() {
        super.configure()
    }
}

