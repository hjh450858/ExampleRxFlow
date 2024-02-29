//
//  LoginVC.swift
//  ExampleRxFlow
//
//  Created by 황재현 on 2/28/24.
//

import UIKit
import RxFlow
import RxCocoa
import RxSwift
import SnapKit



class LoginVC: UIViewController, Stepper {
    
    var steps = PublishRelay<Step>()
    
    let titleLabel = UILabel()
    
    let button = UIButton()
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        bindingVM()
    }
    
    func configureUI() {
        self.title = "LoginVC"
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(button)
        
        titleLabel.text = "LoginVC"
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
        
        button.setTitle("메인으로 이동", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .blue
        
        button.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(40)
        }
    }
    
    func bindingVM() {
        button.rx.tap.subscribe { event in
            print("LoginVC - button - tap()")
            self.steps.accept(MainStep.mainView)
        }.disposed(by: disposeBag)
    }
}
