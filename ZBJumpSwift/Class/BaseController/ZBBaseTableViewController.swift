//
//  ZBBaseTableViewController.swift
//  ZBJumpSwift
//
//  Created by jumpapp1 on 2019/1/21.
//  Copyright © 2019年 zb. All rights reserved.
//

import UIKit

class ZBBaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    ///用户是否登录，没有登录就创建登录界面
    var userLogin = false
    
    override func loadView() {
        
        userLogin ? super.loadView() : setupNologinView()
        
    }
    

    
    //未登录情况下显示的view
    func setupNologinView(){
        
  

    }
}
