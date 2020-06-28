//
//  ViewController.swift
//  LXModalModule
//
//  Created by Mac on 2020/4/29.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit
import LXModalManager

struct model: LXShowListProtocol {
    var id: String = "0"
    
    var title: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton(type: UIButton.ButtonType.contactAdd)
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnclick(_:)), for: UIControl.Event.touchUpInside)
        
        
        let btn1 = UIButton(type: UIButton.ButtonType.contactAdd)
        btn1.backgroundColor = UIColor.red
        btn1.frame = CGRect(x: 220, y: 100, width: 100, height: 100)
        view.addSubview(btn1)
        btn1.addTarget(self, action: #selector(btnclick1(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc private func btnclick1(_ btn: UIButton) {
           
        let listVC = LXShowListModalController()
        listVC.setHandle { (model) in
            print("-=-=-=-=\(model?.title)")
        }
        listVC.show(title: "官方代购个", contents: [model(title: "干啥"),model(title: "v多少v "),model(title: "gr tyh rhdg  "),model(title: "y烦得很复古很 "),model(title: "v韩国国会v ")],clickView: btn, height: 1000)
    }

    @objc private func btnclick(_ btn: UIButton) {
      let config = LXModalConfig()
        config.contentCornerRadius = 10
        config.titleColor = UIColor.blue
        config.titleFont = UIFont.systemFont(ofSize: 20)
        config.contentFont = UIFont.systemFont(ofSize: 16)
        config.contentColor = UIColor.purple

        config.lineSpacing = 15
        config.alignment = .center
        config.itemH = 55
        config.contentViewW = 320
//        config.contentH = 300
        config.alignment = .left
      let showModalVC = LXShowModalController(config)
         showModalVC.show(title: "王者荣耀", content: "受到很高风蛋糕上的风格风糕上的风格风蛋糕上", modalItems:
            LXShowModalItem(title: "确定", titleColor: UIColor.red , callBack: {
                print("------1-")
            }),LXShowModalItem(title: "取消", titleColor: UIColor.black , callBack: {
                print("------2-")
            }))
        }
}

