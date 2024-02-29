//
//  ViewController.swift
//  ExampleRxFlow
//
//  Created by 황재현 on 2/28/24.
//

import UIKit
import RxFlow
import RxCocoa
import RxSwift
import SnapKit



class MainVC: UIViewController, Stepper {
    
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
        self.title = "MainVC"
        self.view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(button)
        
        titleLabel.text = "MainVC"
//        
        titleLabel.snp.makeConstraints { make in
            make.center.equalTo(view.center)
        }
        
        button.setTitle("로그인으로 이동", for: .normal)
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
            print("MainVC - button - tap()")
            self.steps.accept(MainStep.loginView)
        }.disposed(by: disposeBag)
    }
}

