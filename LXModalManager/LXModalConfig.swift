//
//  LXModalConfig.swift
//  LXModalModule
//
//  Created by Mac on 2020/4/29.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit
import LXFitManager

public class LXModalConfig {

    public init(){}
    
    /// 内容圆角
    public var contentCornerRadius: CGFloat = LXFit.fitFloat(10)
    public var contentViewSubViewX: CGFloat = LXFit.fitFloat(20)
    public var contentViewW: CGFloat =  LXFit.fitFloat(288)

    /// 标题颜色和字体大小
    public var titleTop: CGFloat =  LXFit.fitFloat(20)
    public var titleFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .medium).fitFont
    public var titleColor: UIColor = UIColor.black
    
    /// 内容颜色和字体大小
    public var contentTop: CGFloat =  LXFit.fitFloat(13)
    public var contentFont: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular).fitFont
    public var contentColor: UIColor = UIColor.black
    public var contentH: CGFloat =  LXFit.fitFloat(220)
    public var lineSpacing: CGFloat =  LXFit.fitFloat(5) // 行间距
    public var alignment: NSTextAlignment = .center 
    
    /// 线颜色
    public var lineTop: CGFloat =  LXFit.fitFloat(13)
    public var lineColor: UIColor = UIColor.lightGray
    
    /// item 高度
    public var itemH: CGFloat = LXFit.fitFloat(55)

}
