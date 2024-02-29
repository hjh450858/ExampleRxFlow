//
//  MainFlow.swift
//  ExampleRxFlow
//
//  Created by 황재현 on 2/28/24.
//

import Foundation
import RxFlow

class MainFlow: Flow {
    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let vc = UINavigationController()
        return vc
    }()
    
    init() {}
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        switch step {
        case .loginView:
            return .end(forwardToParentFlowWithStep: MainStep.loginView)
        case .mainView:
            return self.navToMainVC()
        }
    }
    
    func navToMainVC() -> FlowContributors {
        let vc = MainVC()
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
    
}
