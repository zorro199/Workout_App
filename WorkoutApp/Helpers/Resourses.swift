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
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview:
                    return "Overview"
                case .session:
                    return "Session"
                case .progress:
                    return "Progress"
                case .settings:
                    return "Settings"
                }
            }
        }
        enum NavBar {
            static let overview = "Today"
        }
        enum Overview {
            static let allWorkoutsButon = "All Workouts"
        }
        enum Progress {
            static let progress = "Progress"
        }
        enum Settings {
            static let settings = "Settings"
        }
        enum Session {
            static let session = "Session"
            static let navBarStart = "Start   "
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
        }
    }
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview:
                    return UIImage(named: "overview_tab") ?? UIImage()
                case .session:
                    return UIImage(named: "session_tab") ?? UIImage()
                case .progress:
                    return UIImage(named: "progress_tab") ?? UIImage()
                case .settings:
                    return UIImage(named: "settings_tab") ?? UIImage()
                }
            }
        }
        enum Common {
            static let downArrow = UIImage(named: "down_arrow") ?? UIImage()
            static let addButton = UIImage(named: "addButton") ?? UIImage()
        }
    }
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
