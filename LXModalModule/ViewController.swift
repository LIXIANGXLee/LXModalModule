//
//  ViewController.swift
//  LXModalModule
//
//  Created by Mac on 2020/4/29.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit
import LXModalManager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.backgroundColor = UIColor.white
        
        let btn = UIButton(type: UIButton.ButtonType.contactAdd)
        
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        view.addSubview(btn)

        
        btn.addTarget(self, action: #selector(btnclick), for: UIControl.Event.touchUpInside)
        
    }

    @objc private func btnclick() {
        
        
      let config = LXModalConfig()
        
        config.contentCornerRadius = 10
        config.titleColor = UIColor.blue
        config.titleFont = UIFont.systemFont(ofSize: 20)
        config.contentFont = UIFont.systemFont(ofSize: 16)
        config.contentColor = UIColor.purple
        
        config.lineSpacing = 15
        config.alignment = .center
        config.itemColor = UIColor.red
        config.itemH = 55
        config.contentViewW = 320
        config.contentH = 100
      let showModalVC = LXShowModalController(config)
         showModalVC.show(title: "王者荣耀", content: "的方的方式度过噶多少空的方式度过噶多少空的方式度过噶多少空的方式度过噶多少空的方式度过噶多少空的方式度过噶多少空的方式度过噶多少空v的方式度\r\n过噶多少空的方式度过<br>噶多少空v的方式度过噶多少空vv的<br>方式度过噶多少空v<br>的方式度<br>过噶多少空vv的方式度过<br>噶多少空v的方式度过噶多少空v的方式度过噶多少空的方式度过噶多少空v的方式度过噶多少空vvvv的方式度过噶多少空v的方式度过噶多少空vvvv的方式度过噶多少空式度过噶多少空", modalItems:
            LXShowModalItem(title: "确定", callBack: {
                print("------1-")
            }),LXShowModalItem(title: "取消", callBack: {
                print("------2-")
            }))
        }
}

