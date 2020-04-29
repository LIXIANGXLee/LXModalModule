# LXModalModule

#### 项目介绍
 **

### 最完美、最轻量级的弹窗 可自定义
** 

#### 安装说明
方式1 ： cocoapods安装库 
        ** pod 'LXModalManager' **
        ** pod install ** 

方式2:   **直接下载压缩包 解压**    **LXModalManager **   

#### 使用说明
 **下载后压缩包 解压   请先 pod install  在运行项目** 
  
```

let config = LXModalConfig()
//config.contentCornerRadius = 20
//config.titleColor = UIColor.blue
//config.titleFont = UIFont.systemFont(ofSize: 20)
//config.contentFont = UIFont.systemFont(ofSize: 16)
//config.contentColor = UIColor.purple

//config.lineSpacing = 15
//config.alignment = .left
//config.itemColor = UIColor.red
//config.itemH = 55

let showModalVC = LXShowModalController(config)
  showModalVC.show(title: "王者荣耀", content: "第三方但是噶的风格发达国家风蛋糕地方给的风格哦的发生地个人经过人给对方观看热狗开发歌 mad歌，的风格<br>都是废话的时光是对方\r\n道具收费附近丢失多少啊但是发的时光", modalItems:
     LXShowModalItem(title: "确定", callBack: {
         print("------1-")
     }),LXShowModalItem(title: "取消", callBack: {
         print("------2-")
     }))
 }
 
```

