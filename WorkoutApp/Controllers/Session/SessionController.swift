//
//  SessionController.swift
//  WorkoutApp
//
//  Created by Zaur on 19.02.2023.
//

import UIKit

class SessionController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "High Intensity Cardio"
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.session
        
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }

}


