//
//  ProfileTableViewController.swift
//  ZBJumpSwift
//
//  Created by jumpapp1 on 2019/1/21.
//  Copyright © 2019年 zb. All rights reserved.
//

import UIKit


class ProfileTableViewController: ZBBaseTableViewController {
    
    
    var headerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {

        tableView.estimatedRowHeight = 0;
        tableView.estimatedSectionHeaderHeight = 0;
        tableView.estimatedSectionFooterHeight = 0;
        tableView.backgroundColor = UIColor.groupTableViewBackground
        
        
        let headerView = HeaderView()
        tableView.tableHeaderView = headerView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}




extension ProfileTableViewController{
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0001
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView .deselectRow(at: indexPath, animated: false);
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "pcCell")
        
        if cell == nil  {
            
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "pcCell")
        }
        
        cell?.textLabel?.text = "个人中心"
        
        cell?.imageView?.image = UIImage(named: ("avatar_grassroot") )
        
        return cell!
    }
}
