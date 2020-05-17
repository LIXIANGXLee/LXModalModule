//
//  LXShowListModalController.swift
//  LXFitManager
//
//  Created by Mac on 2020/5/16.
//

import UIKit
import LXFitManager

///协议 模型遵守
public protocol LXShowListProtocol {
    ///标题
    var title: String { get set }
    
    /// 日后可作唯一标识
    var id: String { get set }

}

private let identified = "UITableViewCell"

public typealias LXListModalCallBack = ((LXShowListProtocol?) -> ())

public class LXShowListModalController: LXBaseModalController {
    
    /// 数据源
    private var tContents = [LXShowListProtocol]()
    /// 是否有标题
    private var tTitle: String = ""
    private var titleAlignment: NSTextAlignment = .center
    private var contentAlignment: NSTextAlignment = .left
    
    ///点击回调
    public  var listModalCallBack: LXListModalCallBack?

    
    // MARK: - tableView
   fileprivate lazy var tableView: UITableView = {
       let tableView = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
       tableView.backgroundColor = UIColor.white
       tableView.separatorStyle = .none
       tableView.dataSource = self
       tableView.delegate = self
       tableView.register(LXShowListCell.self, forCellReuseIdentifier: identified)
       if #available(iOS 11.0, *) {
           tableView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
       }else{
           tableView.translatesAutoresizingMaskIntoConstraints = false
       }
       return tableView
    }()
    
    fileprivate lazy var headerView: UIView = {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width:contentView.bounds.width, height: LXFit.fitFloat(60)))
        headerView.backgroundColor = UIColor.white
        headerView.addSubview(headerTitle)
        headerView.addSubview(lineView)
        return headerView
    }()
    
    public lazy var headerTitle: UILabel = {
        let headerTitle = UILabel(frame: CGRect(x: LXFit.fitFloat(12), y: CGFloat(0), width: contentView.bounds.width - LXFit.fitFloat(24), height: LXFit.fitFloat(59.5)))
        headerTitle.textColor = UIColor.black
        headerTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold).fitFont
        headerTitle.textAlignment = self.titleAlignment
        return headerTitle
    }()
    
    private lazy var lineView: UIView = {
        let lineView = UIView(frame: CGRect(x: 0, y: headerTitle.frame.maxY, width: contentView.bounds.width, height: LXFit.fitFloat(0.5)))
        lineView.backgroundColor = UIColor(red: 240 / 255.0, green: 240 / 255.0, blue: 240 / 255.0, alpha: 1.0)
        return lineView
    }()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        contentView.addSubview(tableView)
        tableView.frame = contentView.bounds
    }

}

extension LXShowListModalController {
    /// 展示弹窗
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - contents: 内容集合
    ///   - clickView: 点击的view 用来约束 弹出框的Y坐标(如果nil 则是剧中显示)
    ///   - titleAlignment: title 内容对齐方式
    ///   - contentAlignment: content 内容对齐方式
    ///   - contentRadius: contentRadius 圆角设置
    ///   - leftRightMargin: 左右边距
    ///   - height: 高度
  public func show(title: String,
                       contents: [LXShowListProtocol],
                       clickView: UIView? = nil,
                       titleAlignment: NSTextAlignment = .center,
                       contentAlignment: NSTextAlignment = .left,
                       contentRadius: CGFloat = 10,
                       leftRightMargin: CGFloat = 40,
                       height: CGFloat = 400) {
          self.tTitle = title
          self.tContents = contents
          self.titleAlignment = titleAlignment
          self.contentAlignment = contentAlignment
          self.tableView.reloadData()
        
          var maxH = min(LXFit.fitFloat(height), CGFloat(tContents.count) * LXFit.fitFloat(44))
          if title.count > 0 { maxH += LXFit.fitFloat(60)  }
          let maxW = UIScreen.main.bounds.width - LXFit.fitFloat(leftRightMargin * 2)
    
          if let clickView = clickView {
            let rect  = clickView.convert(clickView.bounds, to: aboveViewController?.view)
            contentView.frame = CGRect(x: LXFit.fitFloat(leftRightMargin), y: rect.maxY + LXFit.fitFloat(20), width: maxW, height: maxH)
          }else{
            contentView.frame = CGRect(x: LXFit.fitFloat(leftRightMargin), y: (UIScreen.main.bounds.height - maxH) * 0.5, width: maxW, height: maxH)
          }
    
          contentView.layer.cornerRadius = LXFit.fitFloat(contentRadius)
          aboveViewController?.present(self, animated: true, completion: nil)
       }
    
    ///回调函数监听
    public func setHandle(_ listModalCallBack: LXListModalCallBack?) {
        self.listModalCallBack = listModalCallBack
    }
    
}

// MARK: - UITableViewDelegate
extension LXShowListModalController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard tTitle.count > 0 else { return 0.01 }
        return LXFit.fitFloat(60)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return LXFit.fitFloat(44)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard tTitle.count > 0 else { return nil }
        headerTitle.text = tTitle
        return headerView
    }
}

// MARK: - UITableViewDataSource
extension LXShowListModalController: UITableViewDataSource {
        
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tContents.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: identified, for: indexPath) as! LXShowListCell
        cell.tLabel.textAlignment = self.contentAlignment
        cell.tLabel.text = self.tContents[indexPath.row].title
        cell.setHandle { [weak self] (listCell) in
            guard let indexpth = tableView.indexPath(for: listCell) else { return }
            self?.listModalCallBack?((self?.tContents[indexpth.row]))
            self?.dismissViewController()
        }
        return cell
    }
}
