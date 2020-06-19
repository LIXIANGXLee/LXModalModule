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
    /// 标题顶部距离
    public var titleTop: CGFloat = 20
    public var contentTextTop: CGFloat = 13
    public var titleAndcontentTextX: CGFloat = 24
    public var lineTop: CGFloat = 13

    /// 内容圆角
    public var contentCornerRadius: CGFloat = 10
    public var contentViewW: CGFloat = 280

    /// 标题颜色和字体大小
    public var titleFont: UIFont = UIFont.systemFont(ofSize: 18, weight: .medium)
    public var titleColor: UIColor = UIColor.black
    
    /// 内容颜色和字体大小
    public var contentFont: UIFont = UIFont.systemFont(ofSize: 15, weight: .regular)
    public var contentColor: UIColor = UIColor.black
    public var contentH: CGFloat = 220
    public var lineSpacing: CGFloat = 5 // 行间距
    public var alignment: NSTextAlignment = .center 
    
    /// 线颜色
    public var lineColor: UIColor = UIColor.lightGray
    
    /// item 高度
    public var itemH: CGFloat = 55

}
