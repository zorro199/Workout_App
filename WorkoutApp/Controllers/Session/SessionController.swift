//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Zaur on 19.02.2023.
//

import UIKit
import SnapKit

class SessionController: BaseController {
    
    private let timerView: WABaseInfoView = {
        let view = WABaseInfoView(with: "test", buttonTitle: "button test")
        return view
    }()
    
}

extension SessionController {
    
    override func addViews() {
        super.addViews()
        view.addSubviews([timerView])
    }
    
    override func layoutViews() {
        super.layoutViews()
        timerView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.topMargin.equalToSuperview().offset(15)
            $0.height.equalTo(300)
        }
    }
    
    override func configure() {
        super.configure()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resourses.Strings.Session.session
        
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }
}


