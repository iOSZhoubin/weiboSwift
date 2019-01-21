//
//  BaseTabBarViewController.swift
//  ZBJumpSwift
//
//  Created by jumpapp1 on 2019/1/21.
//  Copyright © 2019年 zb. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor .orange
        
        creatInit();
    }
    
    
    func creatInit(){
        
        addChildrenVC(childrenVC: HomeTableViewController(), title: "首页", imageName: "tabbar_home", selectImageName: "tabbar_home_highlighted")

        addChildrenVC(childrenVC: MessageTableViewController(), title: "消息", imageName: "tabbar_message_center", selectImageName: "tabbar_message_center_highlighted")

        addChildrenVC(childrenVC: DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover", selectImageName: "tabbar_discover_highlighte")

        addChildrenVC(childrenVC: ProfileTableViewController(), title: "我", imageName: "tabbar_profile", selectImageName: "tabbar_profile_highlighted")

    }
    
    /**
     *  私有方法
     *  childrenVC:需要添加的自控制器
     *  title:名称
     *  imageName:默认展示的图片
     *  selectImageName:选中的图片
     */
   private func addChildrenVC(childrenVC:UIViewController,title:String,imageName:String,selectImageName:String) {
        
        let nav = UINavigationController.init(rootViewController: childrenVC)
        
        childrenVC.navigationItem.title = title
        
        nav.tabBarItem.title = title
    
        nav.tabBarItem.image = UIImage(named: imageName)
        
        nav.tabBarItem.selectedImage = UIImage(named: selectImageName)
        
        addChildViewController(nav)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
