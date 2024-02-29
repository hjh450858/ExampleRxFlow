//
//  LoginFlow.swift
//  ExampleRxFlow
//
//  Created by 황재현 on 2/28/24.
//

import Foundation
import RxFlow

class LoginFlow: Flow {
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
            return self.navToLogin()
        case .mainView:
            return .end(forwardToParentFlowWithStep: MainStep.mainView)
        }
    }
    
    /// 로그인화면 이동
    func navToLogin() -> FlowContributors {
        // 로그인화면
        let vc = LoginVC()
        // 네비게이션뷰컨에 부여하기
        self.rootViewController.setViewControllers([vc], animated: false)
        return .one(flowContributor: .contribute(withNext: vc))
    }
    
}
