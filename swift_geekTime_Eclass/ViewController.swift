//
//  ViewController.swift
//  swift_geekTime_Eclass
//
//  Created by Yuhong He on 08/10/2023.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .custom)
        button.setTitle("click", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(didClickButton), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints{ (make) in
            make.left.top.equalTo(100)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }

    @objc func didClickButton() {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }

}

