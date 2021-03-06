//
//  LXShowModalController.swift
//  LXModalModule
//
//  Created by Mac on 2020/4/29.
//  Copyright © 2020 李响. All rights reserved.
//

import UIKit

public typealias ShowModalCallBack = (() -> Void)

// MARK: - ShowModalItem
public struct LXShowModalItem {
   public var title: String
   public var titleColor: UIColor
   public var titleFont: UIFont 

   public var callBack: ShowModalCallBack?
   public init(title: String,
                titleColor: UIColor = UIColor.black,
                titleFont: UIFont = UIFont.systemFont(ofSize: 16,
                                                      weight: .regular),
                callBack: ShowModalCallBack?) {
        self.title = title
        self.titleFont = titleFont
        self.titleColor = titleColor
        self.callBack = callBack
    }
}

// MARK: - LXShowModalController
public class LXShowModalController: LXBaseModalController {
    private lazy var titleLabel: UILabel = {
       let titleLabel = UILabel()
       titleLabel.textAlignment = .center
       titleLabel.textColor = modaConfig.titleColor
       titleLabel.font = modaConfig.titleFont
       return titleLabel
    }()
       
    private lazy var contentTextView: UITextView = {
       let contentTextView = UITextView()
       contentTextView.isEditable = false
       contentTextView.isScrollEnabled = modaConfig.contentScrollEnabled
       contentTextView.isSelectable = modaConfig.contentSelectable
       return contentTextView
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = modaConfig.lineColor
        return lineView
    }()
    
    // modaItems 集合
    private var itemViews = [LXItemView]()
    // ModalItem事件集合
    private var modalItems = [LXShowModalItem]()
    // 配置文件
    private var modaConfig: LXModalConfig
    public init(_ modaConfig: LXModalConfig) {
        self.modaConfig = modaConfig
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(contentTextView)
        contentView.addSubview(contentTextView)
        contentView.addSubview(lineView)
    }
    
    public override func backgroundViewTap() {
        if self.modaConfig.isDismissBg {
            super.backgroundViewTap()
        }
    }
    
}

// MARK: - 外部调用类 public
extension LXShowModalController {
    
   /// 展示弹窗
   ///
   /// - Parameters:
   ///   - title: 标题
   ///   - content: 内容
   ///   - period: 内容分几段 方便计算高度
   ///   - item:  可以多个
    public func show(with vc: UIViewController? = nil,
                     title: String,
                 content: String,
                 modalItems: LXShowModalItem...) {
       self.modalItems = modalItems
       self.titleLabel.text = title
    
       //设置内容
       setContent(content)
       //ModaItem 可多个
       setModaItem()
       // 布局尺寸
       setAllContentFrame()
    
        let aboveVC = vc ?? aboveViewController
        
        aboveVC?.present(self,
                         animated: true,
                         completion: nil)
    }
}

// MARK: - priate
extension LXShowModalController {
    /// 设置内容相关
    private func setContent(_ message: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = self.modaConfig.lineSpacing
        paragraphStyle.alignment  = self.modaConfig.alignment
        let content = message.replacingOccurrences(of: "<br>", with: "\r\n")
        let attrs = [NSAttributedString.Key.font: self.modaConfig.contentFont,NSAttributedString.Key.foregroundColor: self.modaConfig.contentColor,NSAttributedString.Key.paragraphStyle: paragraphStyle]
        contentTextView.attributedText = NSAttributedString(string: content, attributes: attrs)
    }
    
    /// 设置modaItem 相关
    private func setModaItem() {
        
        for modalItem in modalItems {
            let itemView = LXItemView()
            itemView.lineView.backgroundColor = self.modaConfig.lineColor
            itemView.setTitle(modalItem.title, for:.normal)
            itemView.setTitleColor(modalItem.titleColor, for: .normal)
            itemView.titleLabel?.font = modalItem.titleFont
            contentView.addSubview(itemView)
            itemViews.append(itemView)
            itemView.addTarget(self,
                               action: #selector(itemViewClick(_:)),
                               for: UIControl.Event.touchUpInside)
        }
    }
    
    ///事件监听 及回调
    @objc private func itemViewClick(_ itemView: LXItemView) {
        modalItems[itemView.tag].callBack?()
        dismissViewController()
    }
    
    /// 布局尺寸
    private func setAllContentFrame() {
       
        contentView.layer.cornerRadius = self.modaConfig.contentCornerRadius
        
        contentView.frame = CGRect(x: (UIScreen.main.bounds.width - modaConfig.contentViewW) * 0.5,
                                   y: (UIScreen.main.bounds.height - contentViewHeight()) * 0.5 + modaConfig.contentViewOffSet,
                                   width: modaConfig.contentViewW,
                                   height: contentViewHeight())
        
        titleLabel.frame = CGRect(x: self.modaConfig.contentViewSubViewX,
                                  y: modaConfig.titleTop,
                                  width: contentView.frame.width - modaConfig.contentViewSubViewX * 2,
                                  height: titleHeight())
        
        contentTextView.textContainerInset = UIEdgeInsets.zero
        contentTextView.frame = CGRect(x:modaConfig.contentViewSubViewX,
                                       y: titleLabel.frame.maxY + modaConfig.contentTop,
                                       width: contentView.frame.width - modaConfig.contentViewSubViewX * 2,
                                       height:  min(contentHeight(), modaConfig.contentH))
        
        lineView.frame = CGRect(x: 0,
                                y:contentTextView.frame.maxY + modaConfig.lineTop,
                                width: contentView.frame.width,
                                height: scale_ip6_width(0.5))
        
        let colW = contentView.frame.width / CGFloat(itemViews.count)
        for (index, itemView) in itemViews.enumerated() {
            if itemViews.count == 1 {
                itemView.lineView.isHidden = true
            }
            itemView.tag = index
            itemView.frame = CGRect(x: CGFloat(index) * colW,
                                    y: lineView.frame.maxY,
                                    width: colW,
                                    height: self.modaConfig.itemH)
            itemView.setLineViewFrame()
        }
    }
    
    /// 标题高度
    private func titleHeight() -> CGFloat {
        
        guard let attText = self.titleLabel.attributedText, attText.string.count > 0 else { return 0}
        let size = CGSize(width:modaConfig.contentViewW - modaConfig.contentViewSubViewX,
                          height: CGFloat.greatestFiniteMagnitude)
        let contentSize = attText.boundingRect(with: size,
                                               options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                               context: nil).size
       return contentSize.height
    }
    
    /// 内容高度
    private func contentHeight() -> CGFloat {
        if contentTextView.text.count <= 0 { return 0 }
        let size = CGSize(width: modaConfig.contentViewW - modaConfig.contentViewSubViewX,
                          height: CGFloat.greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = modaConfig.lineSpacing
        let contentSize = contentTextView.attributedText.boundingRect(with: size,
                                                                      options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                      context: nil).size
        return min(contentSize.height, modaConfig.contentH)
    }
    
    ///contentView 高度
    private func contentViewHeight() -> CGFloat {
        return modaConfig.titleTop + titleHeight() + modaConfig.contentTop + contentHeight() + modaConfig.lineTop + scale_ip6_width(0.5) + modaConfig.itemH
    }
}

// MARK: - LXItemView
public class LXItemView: UIButton {
    //线的view
    public var lineView: UIView!
    public override init(frame: CGRect) {
        super.init(frame: frame)
        lineView = UIView()
        addSubview(lineView)
    }
    
    ///布局线的尺寸
    public func setLineViewFrame() {
        lineView.frame = CGRect(x: frame.width - scale_ip6_width(0.5),
                                y: 0,
                                width: scale_ip6_width(0.5),
                                height: frame.height)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
