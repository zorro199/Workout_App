//
//  OverViewNavBar.swift
//  WorkoutApp
//
//  Created by Zaur on 23.02.2023.
// 

import UIKit
import SnapKit

final class OverViewNavBar: BaseView{
    private var titleLable: UILabel = {
        let lable = UILabel()
        lable.text = Resourses.Strings.NavBar.overview
        lable.textColor = Resourses.Colors.darkGray
        lable.font = Resourses.Fonts.helveticaRegular(with: 22)
        return lable
    }()
    private var addButton: UIButton = {
        let button = UIButton()
        button.setImage(Resourses.Images.Common.addButton, for: .normal)
        return button
    }()
    private var weekView = WeekView()
    
    private let allWorkoutsButton = SecondaryButton()
    
    // layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resourses.Colors.separator, height: 1)
    }
    
    // funcs action
    func addAllWorkoutsAction(_ action: Selector, with target: Any?) {
        allWorkoutsButton.addTarget(target, action: action, for: .touchUpInside)
    }
    func addButtonAction(_ action: Selector, with target: Any?) {
        addButton.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension OverViewNavBar {
    
    override func addViews() {
        super.addViews()
        addSubviews([allWorkoutsButton, titleLable, addButton, weekView])
    }
    
    override func layoutViews() {
        super.layoutViews()
        addButton.snp.makeConstraints {
            $0.topMargin.equalTo(8)
            $0.trailing.equalTo(-15)
            $0.height.width.equalTo(28)
        }
        allWorkoutsButton.snp.makeConstraints {
            $0.top.equalTo(addButton.snp.top)
            $0.trailing.equalTo(addButton.snp.leading).offset(-15)
            $0.height.equalTo(28)
            $0.width.equalTo(130)
        }
        titleLable.snp.makeConstraints {
            $0.centerY.equalTo(allWorkoutsButton.snp.centerY)
            $0.trailing.equalTo(allWorkoutsButton.snp.leading)
            $0.leading.equalToSuperview().offset(15)
        }
        weekView.snp.makeConstraints {
            $0.top.equalTo(addButton.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().offset(-15)
            $0.bottom.equalToSuperview().offset(-15)
            $0.height.equalTo(50)
        }
}
    
    override func configure() {
        super.configure()
        backgroundColor = .white
        allWorkoutsButton.setTitle(Resourses.Strings.Overview.allWorkoutsButon)
    }
}

