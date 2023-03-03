//
//  WeekDayView.swift
//  WorkoutApp
//
//  Created by Zaur on 24.02.2023.
//

import UIKit
import SnapKit

extension WeekView {
    final class WeekDayView: BaseView {
        
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
         
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.spacing = 3
            stackView.axis = .vertical
            return stackView
        }()
        
    }
}

extension WeekView.WeekDayView {
    override func addViews() {
        super.addViews()
        addSubview(stackView)
        stackView.addSubviews([dateLabel, nameLabel])
    }
    override func layoutViews() {
        super.layoutViews()
        stackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    override func configure() {
        super.configure()
        backgroundColor = .red
    }
}
