//
//  AppStepper.swift
//  ExampleRxFlow
//
//  Created by 황재현 on 2/28/24.
//

import Foundation
import RxFlow
import RxCocoa
import RxSwift


class AppStepper: Stepper {
    var steps = PublishRelay<Step>()
    
    let disposeBag = DisposeBag()
    
    init() {}
    
    var initialStep: Step {
        return MainStep.loginView
    }
}
