//
//  ProgressController.swift
//  WorkoutApp
//
//  Created by Zaur on 19.02.2023.
//

import UIKit

class ProgressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout Progress"
        navigationController?.tabBarItem.title = Resourses.Strings.TabBar.progress
        
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }


}


