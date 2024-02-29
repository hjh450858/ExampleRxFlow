//
//  AppFlow.swift
//  ExampleRxFlow
//
//  Created by 황재현 on 2/28/24.
//

import Foundation
import RxFlow
import RxCocoa


/// 앱 전체 navigation을 컨트롤
class AppFlow: Flow {
    var window: UIWindow
    
    var root: Presentable {
        return self.window
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? MainStep else { return .none }
        
        switch step {
        case .loginView:
            return self.navToLogin()
        case .mainView:
            return self.navToMain()
        }
    }
    
    
    func navToLogin() -> FlowContributors {
        let loginFlow = LoginFlow()
        // Flows.use = 특정 Flow를 사용하겠다
        Flows.use(loginFlow, when: .created) { root in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: MainStep.loginView)))
    }
    
    func navToMain() -> FlowContributors {
        let mainFlow = MainFlow()
        Flows.use(mainFlow, when: .created) { root in
            self.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(withNextPresentable: mainFlow, withNextStepper: OneStepper(withSingleStep: MainStep.mainView)))
    }
}
