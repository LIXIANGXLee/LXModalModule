//
//  LXModalConfig.swift
//  LXModalModule
//
//  Created by Mac on 2020/4/29.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit

public class LXModalConfig {

    public init(){}
    
    /// 内容圆角
    public var contentCornerRadius: CGFloat = 10
    
    /// 标题颜色和字体大小
    public var titleFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .medium)
    public var titleColor: UIColor = UIColor.black
    
    /// 内容颜色和字体大小
    public var contentFont: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular)
    public var contentColor: UIColor = UIColor.black
    public var lineSpacing: CGFloat = 5 // 行间距
    public var alignment: NSTextAlignment = .center 
    
    /// 线颜色
    public var lineColor: UIColor = UIColor.lightGray
    
    /// item 字体大小和颜色
    public var itemFont: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular)
    public var itemColor: UIColor = UIColor.black
    public var itemH: CGFloat = 55

}
