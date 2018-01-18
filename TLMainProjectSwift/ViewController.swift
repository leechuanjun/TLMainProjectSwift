//
//  ViewController.swift
//  TLMainProjectSwift
//
//  Created by lichuanjun on 2018/1/18.
//  Copyright © 2018年 lichuanjun. All rights reserved.
//

import UIKit
import SnapKit
import TLAModuleCTMediator

class ViewController: UIViewController {

    lazy var pushAVCButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pushAVCButton.setTitle("push A ViewController", for:.normal)
        pushAVCButton.setTitleColor(UIColor.black, for: .normal) //普通状态下文字的颜色
        pushAVCButton.setTitleShadowColor(UIColor.green, for:.normal) //普通状态下文字阴影的颜色
        pushAVCButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        pushAVCButton.backgroundColor = UIColor.green
        pushAVCButton.addTarget(self, action: #selector(pushVCAction(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pushAVCButton)
        pushAVCButton.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.width.equalTo(self.view)
            make.height.equalTo(60)
        };
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func pushVCAction(_ button: UIButton){
        let acontroller = CTMediator.sharedInstance().tlaModule_ViewController { (result) in
            print(result ?? "default value")
        }
        self.navigationController?.pushViewController(acontroller!, animated: true)
        
    }
}

