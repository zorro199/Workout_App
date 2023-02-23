//
//  OverViewNavBar.swift
//  WorkoutApp
//
//  Created by Zaur on 23.02.2023.
//

import UIKit

final class OverViewNavBar: BaseView{
    private let allWorkoutsButton = SecondaryButton()
}

extension OverViewNavBar {
    
    override func addViews() {
        super.addViews()
        addSubviews(allWorkoutsButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .white
        addBottomBorder(with: Resourses.Colors.separator, height: 1)
        allWorkoutsButton.setTitle(Resourses.Strings.Overview.allWorkoutsButon)
        allWorkoutsButton.addTarget(self, action: #selector(allWorkoutsButtonHandler), for: .touchUpInside)
    }
}

@objc extension OverViewNavBar {
    func allWorkoutsButtonHandler() {
        print("All Workouts")
    }
}
