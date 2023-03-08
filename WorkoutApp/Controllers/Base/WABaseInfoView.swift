//
//  BaseInfoView.swift
//  WorkoutApp
//
//  Created by Zaur on 07.03.2023.
//

import UIKit
import SnapKit

class WABaseInfoView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resourses.Fonts.helveticaRegular(with: 13)
        label.textColor = Resourses.Colors.inactive
        return label
    }()
    
    private let button = WAButton(with: .primary)
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = Resourses.Colors.separator.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 5
        return view
    }()
    
    init(with title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        button.setTitle(buttonTitle)
        button.isHidden = buttonTitle == nil ? true : false
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonTarget(target: Any?, action: Selector) {
        button.addTarget(target, action: action, for: .touchUpInside)
    }
}

extension WABaseInfoView {
    override func addViews() {
        super.addViews()
        addSubviews([titleLabel, button, contentView])
    }
    
    override func layoutViews() {
        super.layoutViews()
        let topAnchor = titleLabel.text == nil ? snp.top : titleLabel.snp.bottom
        let contentTypeOffset: CGFloat = titleLabel.text == nil ? 0 : 10
        // layout
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
        }
        button.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.height.equalTo(30)
            //$0.width.equalTo(130)
        }
        contentView.snp.makeConstraints {
            $0.top.equalTo(topAnchor).offset(contentTypeOffset)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .clear
    }
}
