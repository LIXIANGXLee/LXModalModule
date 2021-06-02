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
    public var contentCornerRadius: CGFloat = scale_ip6_width(10)
    public var contentViewSubViewX: CGFloat = scale_ip6_width(20)
    public var contentViewW: CGFloat = scale_ip6_width(288)
    
    //  距离中间位置的偏移量
    public var contentViewOffSet: CGFloat =  0

    /// 标题颜色和字体大小 距离顶部的距离
    public var titleTop: CGFloat = scale_ip6_width(20)
    public var titleFont: UIFont = UIFont.systemFont(ofSize: 18,
                                                     weight: .medium)
    public var titleColor: UIColor = UIColor.black
    
    /// 内容颜色和字体大小 距离title的距离
    public var contentTop: CGFloat = scale_ip6_width(13)
    public var contentFont: UIFont = UIFont.systemFont(ofSize: 15,
                                                       weight: .regular)
    public var contentColor: UIColor = UIColor.black
    // 内容的最大高度
    public var contentH: CGFloat = scale_ip6_width(220)
    // 行间距
    public var lineSpacing: CGFloat = scale_ip6_width(5)
    public var alignment: NSTextAlignment = .center
    
    // 是否可选中复制
    public var contentSelectable: Bool = false
    // 内容是否可以滑动滚动
    public var contentScrollEnabled: Bool = false

    
    /// 线颜色 和 距离内容的距离
    public var lineTop: CGFloat =  scale_ip6_width(13)
    public var lineColor: UIColor = UIColor.lightGray
    
    /// item 高度
    public var itemH: CGFloat = scale_ip6_width(55)

}
/// 标准iphone6适配宽度
 func scale_ip6_width(_ distance: CGFloat) -> CGFloat {
    let s = UIScreen.main.scale
    return ceil(distance * (UIScreen.main.bounds.width / 375) * s) / s
 }
