//
//  LXShowListCell.swift
//  LXFitManager
//
//  Created by Mac on 2020/5/17.
//

import UIKit
typealias LXShowListCellCallBack = ((LXShowListCell) -> ())

class LXShowListCell: UITableViewCell {
    ///点击回调
    public  var listCellCallBack: LXShowListCellCallBack?

    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(tLabel)
        contentView.addSubview(lineView)
        tLabel.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                           action: #selector(viewClick)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
      // 充电信息label
     public lazy var tLabel: UILabel = {
         let tLabel = UILabel()
         tLabel.textColor = UIColor.black
         tLabel.font = UIFont.systemFont(ofSize: 16)
         tLabel.isUserInteractionEnabled = true
         return tLabel
     }()
    
    public lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor(red: 240 / 255.0,
                                           green: 240 / 255.0,
                                           blue: 240 / 255.0,
                                           alpha: 1.0)
        return lineView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tLabel.frame = CGRect(x: scale_ip6_width(12),
                              y: 0,
                              width: bounds.width - scale_ip6_width(24),
                              height: bounds.height - scale_ip6_width(0.5))
        lineView.frame = CGRect(x: 0,
                                y: tLabel.frame.maxY,
                                width: bounds.width,
                                height: scale_ip6_width(0.5))
    }
}

extension LXShowListCell {
    ///回调函数监听
   public func setHandle(_ listCellCallBack: LXShowListCellCallBack?) {
        self.listCellCallBack = listCellCallBack
   }
    
   @objc  private  func viewClick() {
        self.listCellCallBack?(self)
        contentView.backgroundColor = self.lineView.backgroundColor
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.contentView.backgroundColor = UIColor.white
        }
    }
}
