//
//  SecondaryButton.swift
//  WorkoutApp
//
//  Created by Zaur on 20.02.2023.
//

import UIKit
import SnapKit

public enum WAButtonType {
    case primary
    case secondary
}

final class WAButton: UIButton {
    
    private var type: WAButtonType
    
    // Setting view
    private var lable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        return lable
    }()
    private var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = Resourses.Images.Common.downArrow.withRenderingMode(.alwaysTemplate)
        return iconView
    }()
    
    init(with type: WAButtonType) {
        self.type = type
        super.init(frame: .zero)
        configure()
        addViews()
        layoutViews()
    }
    
    //MARK: - OVERRIDE
    required init?(with type: WAButtonType, frame: CGRect) {
        self.type = type
        super.init(frame: .zero)
        configure()
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String?) {
        lable.text = title
    }
    
}

private extension WAButton {
    func addViews() {
        addSubviews([lable, iconView])
    }
    func layoutViews() {
        var horizontalOffset: CGFloat {
            switch type {
            case .primary:
                return 0
            case .secondary:
                return -10
            }
        }
        // layout
        iconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(horizontalOffset)
            $0.height.equalTo(5)
            $0.width.equalTo(10)
        }
        lable.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(iconView.snp.leading).offset(-10)
            $0.leading.equalToSuperview().offset(10)
        }
    }
    func configure() {
        switch type {
        case .primary:
            lable.textColor = Resourses.Colors.inactive
            lable.font = Resourses.Fonts.helveticaRegular(with: 13)
            iconView.tintColor = Resourses.Colors.inactive
        case .secondary:
            lable.textColor = Resourses.Colors.active
            lable.font = Resourses.Fonts.helveticaRegular(with: 15)
            iconView.tintColor = Resourses.Colors.active
            backgroundColor = Resourses.Colors.secondary
            layer.cornerRadius = 14
        }
        makeSystem(self)
    }
}
