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
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = Resourses.Fonts.helveticaRegular(with: 9)
            label.textAlignment = .center
            return label
        }()
        
        private let dateLabel: UILabel = {
            let label = UILabel()
            label.font = Resourses.Fonts.helveticaRegular(with: 15)
            label.textAlignment = .center
            return label
        }()
         
        private let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.spacing = 3
            stackView.axis = .vertical
            return stackView
        }()
        
        func configureDate(with index: Int, and name: String) {
            let startOfweek = Date().startOfweek
            let currentDay = startOfweek.agoForward(to: index)
            let day = Calendar.current.component(.day, from: currentDay)
            let isToday = currentDay.stripTime() == Date().stripTime()
            backgroundColor = isToday ? Resourses.Colors.active : Resourses.Colors.background
            //
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : Resourses.Colors.inactive
            //
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : Resourses.Colors.inactive
        }
    }
}

extension WeekView.WeekDayView {
    override func addViews() {
        super.addViews()
        addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
    }
    override func layoutViews() {
        super.layoutViews()
        stackView.snp.makeConstraints  {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    override func configure() {
        super.configure()
        layer.cornerRadius = 5
        layer.masksToBounds = true
    }
}
