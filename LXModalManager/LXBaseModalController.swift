//
//  LXBaseModalController.swift
//  LXModalModule
//
//  Created by Mac on 2020/4/29.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit

// MARK: - 可继承
open class LXBaseModalController: UIViewController {

    /// 重写构造方法
    public override init(nibName nibNameOrNil: String?,
                         bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        //设置模态状态
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overCurrentContext
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        view.addSubview(contentView)

        //self.view点击事件
        view.addGestureRecognizer(tapGesture)
        
        //contentView点击事件
        contentView.addGestureRecognizer(contentGesture)
        
    }
    
     /// 白色弹窗的view的点击事件
      open lazy var contentGesture: UITapGestureRecognizer = {
          return  UITapGestureRecognizer(target: self,
                                         action: #selector(contentViewTap(tap:)))
      }()
    
    /// 全屏点击事件监听
      open lazy var tapGesture: UITapGestureRecognizer = {
          return UITapGestureRecognizer(target: self,
                                        action: #selector(backgroundViewTap))
      }()
    
    /// 懒加载内容的view,
      open lazy var contentView: UIView = {
           let contentView = UIView()
           contentView.backgroundColor = UIColor.white
           contentView.clipsToBounds = true
           return contentView
       }()
   
}

// MARK: - 外部调用 扩展
extension LXBaseModalController {
    
    /// 点击灰色背景, 隐藏modal控制器
    @objc open func backgroundViewTap() {
        dismissViewController()
    }

     /// 点击白色背景 触发事件
    @objc open func contentViewTap(tap: UITapGestureRecognizer) { }
    
    /// 模态窗口dismiss方法
    open func dismissViewController() {
       if navigationController != nil {
           navigationController?.dismiss(animated: true,
                                         completion: nil)
       }else{
           dismiss(animated: true, completion: nil)
       }
   }
    
    /// presented跟控制器
   open var aboveViewController: UIViewController? {
       var aboveController = UIApplication.shared.delegate?.window??.rootViewController
       while aboveController?.presentedViewController != nil {
           aboveController = aboveController?.presentedViewController
       }
       return aboveController
   }
}
