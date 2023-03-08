//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Zaur on 19.02.2023.
//

import UIKit
import SnapKit

class SessionController: BaseController {
    
    private let timerView = TimerView()
    
    private let timerDuration = 4.0
    
    override func leftButtonHandler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        setTitleForNavBarButton(
            timerView.state == .isRuning ? Resourses.Strings.Session.navBarPause : Resourses.Strings.Session.navBarStart, at: .left)
    }
    
    override func rightButtonHandler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        setTitleForNavBarButton(Resourses.Strings.Session.navBarFinish, at: .right)
    }
    
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
            $0.height.equalTo(400)
        }
    }
    
    override func configure() {
        super.configure()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resourses.Strings.Session.session
        addNavBarButton(at: .left, with: Resourses.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: Resourses.Strings.Session.navBarFinish)
        timerView.configure(with: timerDuration, progress: 1.5)
    }
}


