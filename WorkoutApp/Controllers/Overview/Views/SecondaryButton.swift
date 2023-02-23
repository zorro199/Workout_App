//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Zaur on 20.02.2023.
//

import UIKit
import SnapKit

final class SecondaryButton: UIButton {
    
    // Setting view
    private var lable: UILabel = {
        let lable = UILabel()
        lable.textColor = Resourses.Colors.active
        lable.textAlignment = .center
        lable.font = Resourses.Fonts.helveticaRegular(with: 15)
        return lable
    }()
    private var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = Resourses.Images.Common.downArrow.withRenderingMode(.alwaysTemplate)
        iconView.tintColor = Resourses.Colors.active
        return iconView
    }()
    
    //MARK: - OVERRIDE
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        lable.text = title
    }
    
}

private extension SecondaryButton {
    func configure() {
        backgroundColor = Resourses.Colors.secondary
        layer.cornerRadius = 14
        makeSystem(self)
    }
    func addViews() {
        addSubviews([lable, iconView])
    }
    func layoutViews() {
        iconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-10)
            $0.height.equalTo(5)
            $0.width.equalTo(10)
        }
        lable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(iconView.snp.leading)
            $0.leading.equalToSuperview().offset(10)
        }
    }
}
