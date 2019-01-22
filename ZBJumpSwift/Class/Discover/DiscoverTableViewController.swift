//
//  DiscoverTableViewController.swift
//  ZBJumpSwift
//
//  Created by jumpapp1 on 2019/1/21.
//  Copyright © 2019年 zb. All rights reserved.
//

import UIKit


class DiscoverTableViewController: ZBBaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    //MARK: 初始化UI
    
    func setupUI() {
        
        tableView.register(UINib.init(nibName: "DicCoverDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DicCoverDetailTableViewCell")
    }
    
}



extension DiscoverTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView .deselectRow(at: indexPath, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DicCoverDetailTableViewCell", for: indexPath)
        
        return cell
    }
  
}
