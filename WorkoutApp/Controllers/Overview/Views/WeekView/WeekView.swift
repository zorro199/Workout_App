//
//  WeekView.swift
//  WorkoutApp
//
//  Created by Zaur on 24.02.2023.
//

import UIKit
import SnapKit

final class WeekView: BaseView {
    
    private let calendar = Calendar.current
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 7
        stackView.distribution = .fillEqually
        return stackView
    }()
    
}

extension WeekView {
    override func addViews() {
        super.addViews()
        addSubviews([stackView])
    }
    override func layoutViews() {
        super.layoutViews()
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    override func configure() 
        super.configure()
        let weekDays = calendar.shortStandaloneWeekdaySymbols
        weekDays.forEach { _ in
            let view = WeekDayView()
            stackView.addArrangedSubview(view)
        }
    }
}
