//
//  Resourses.swift
//  WorkoutApp
//
//  Created by Zaur on 15.02.2023.
//

import UIKit

enum Resourses {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let darkGray = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F8F9F9")
        static let secondary = UIColor(hexString: "#F0F3FF")
    }
    enum Strings {
        enum TabBar {
            static let overview = "Overview"
            static let session = "Session"
            static let progress = "Progress"
            static let settings = "Settings"
        }
        enum Overview {
            static let allWorkoutsButon = "All Workouts"
        }
    }
    enum Images {
        enum TabBar {
            static let overview = UIImage(named: "overview_tab") ?? UIImage()
            static let session = UIImage(named: "session_tab") ?? UIImage()
            static let progress = UIImage(named: "progress_tab") ?? UIImage()
            static let settings = UIImage(named: "settings_tab") ?? UIImage()
        }
        enum Common {
            static let downArrow = UIImage(named: "down_arrow") ?? UIImage()
        }
    }
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
