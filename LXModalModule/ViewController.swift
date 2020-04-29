//
//  ViewController.swift
//  LXModalModule
//
//  Created by Mac on 2020/4/29.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit

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
        
        config.contentCornerRadius = 20
        config.titleColor = UIColor.blue
        config.titleFont = UIFont.systemFont(ofSize: 20)
        config.contentFont = UIFont.systemFont(ofSize: 16)
        config.contentColor = UIColor.purple
        
        config.lineSpacing = 15
        config.alignment = .left
        config.itemColor = UIColor.red
        config.itemH = 55
        
      let showModalVC = LXShowModalController(config)
         showModalVC.show(title: "王者荣耀", content: "第三方但是噶的风格发达国家风蛋糕地方给的风格哦的发生地个人经过人给对方观看热狗开发歌 mad歌，的风格<br>都是废话的时光是对方\r\n道具收费附近丢失多少啊但是发的时光第三方但是噶的风格发达国家风蛋糕地方给的风格哦的发生地个人经过人给对方观看热狗开发歌 mad歌，的风格<br>都是废话的时光是对方\r\n道具收费附近丢失多少啊但是发的时光", modalItems:
            LXShowModalItem(title: "确定", callBack: {
                print("------1-")
            }),LXShowModalItem(title: "取消", callBack: {
                print("------2-")
            }))
        }
}

