//
//  BaseTabBarViewController.swift
//  ZBJumpSwift
//
//  Created by jumpapp1 on 2019/1/21.
//  Copyright © 2019年 zb. All rights reserved.
//

import UIKit
import MJExtension

class BaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor .orange
        
        creatInit()
        
//        creatVc() //通过json数据动态加载控制器
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
    
    

    
    
/**================================= 动态创建控制器 ===========================================*/
    
    func  creatVc() {
        
        //获取json文件路径
        let path = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil)
        
        //通过文件路径创建NSData,序列化json数据 -> array
        if let jsonPath = path{
            
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            let jsonStr = jsonData?.mj_JSONString()
            
            let jsonArray = jsonStr?.mj_JSONObject()
            
            //遍历数组，动态创建控制器和设置数据(as! [[String:String]] 要告诉他jsonArray的类型)
            for dict in jsonArray as! [[String:String]]{
                
                let vcName = dict["vcName"]!
                let title = dict["title"]!
                let imageName = dict["imageName"]!
                let selectImageName = dict["selectImageName"]!
                
                addChildrenWithString(childrenName:vcName, title: title, imageName: imageName, selectImageName:selectImageName)
                
            }
        }else{
           
            //如果没解析成功，就加载本地默认的数据
            addChildrenVC(childrenVC: HomeTableViewController(), title: "首页", imageName: "tabbar_home", selectImageName: "tabbar_home_highlighted")
            
            addChildrenVC(childrenVC: MessageTableViewController(), title: "消息", imageName: "tabbar_message_center", selectImageName: "tabbar_message_center_highlighted")
            
            addChildrenVC(childrenVC: DiscoverTableViewController(), title: "发现", imageName: "tabbar_discover", selectImageName: "tabbar_discover_highlighte")
            
            addChildrenVC(childrenVC: ProfileTableViewController(), title: "我", imageName: "tabbar_profile", selectImageName: "tabbar_profile_highlighted")
        }
    }
    
    /**
     *   通过JSON返回的数据创建控制器（节日可变更控制器）
     *   childrenName:控制器名称字符串
     *   title:名称
     *   imageName:默认展示的图片
     *   selectImageName:选中的图片
     */
    
    private func addChildrenWithString(childrenName:String,title:String,imageName:String,selectImageName:String) {
        
        //动态获取命名空间
        let name = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        
        //将字符串转为类
        let cls:AnyClass? =  NSClassFromString(name+"."+childrenName)
        
        print(cls!)
        
        //将AnyClass转换为指定的类型
        let vcCls = cls as! UIViewController.Type
        
        //通过类创建对象
        let vc = vcCls.init()
        
        print(vc)
        
        let nav = UINavigationController.init(rootViewController: vc)
        
        vc.navigationItem.title = title
        
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
