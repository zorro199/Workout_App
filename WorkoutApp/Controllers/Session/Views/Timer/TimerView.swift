//
//  TimerView.swift
//  WorkoutApp
//
//  Created by Zaur on 08.03.2023.
//

import UIKit
import SnapKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timeProgress: CGFloat = 0
    private var timeDuration = 0.0
    
    public var state: TimerState = .isStopped
    
    func configure(with duration: Double, progress: Double) {
        timeDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timeProgress += 0.01
            if self.timeProgress > self.timeDuration {
                self.timeDuration = self.timeProgress
                timer.invalidate()
            }
            self.configure(with: self.timeDuration, progress: self.timeProgress)
        })
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timeProgress > 0 else { return }
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else { return }
            self.timeProgress -= 0.01
            if self.timeProgress <= 0 {
                self.timeProgress = 0
                timer.invalidate()
            }
            self.configure(with: self.timeDuration, progress: self.timeProgress)
        })
    }
    
}

extension TimerView {
    
    override func addViews() {
        super.addViews()
        addSubviews([progressView])
    }
    
    override func layoutViews() {
        super.layoutViews()
        progressView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-40)
            $0.leading.equalToSuperview().offset(40)
            $0.top.equalToSuperview().offset(40)
            $0.height.equalTo(progressView.snp.width)
        }
    }
    
    override func configure() {
        super.configure()
    }
}
