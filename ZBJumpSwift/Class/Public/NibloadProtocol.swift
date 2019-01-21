//
//  NibloadProtocol.swift
//  Fashion
//
//  Created by AlphaZ on 2018/4/25.
//  Copyright © 2018年 AlphaZ. All rights reserved.
//

import Foundation
import UIKit
 protocol NibloadProtocol {

}

 extension NibloadProtocol where Self : UIView{
    /*
     static func loadNib(_ nibNmae :String = "") -> Self{
     let nib = nibNmae == "" ? "\(self)" : nibNmae
     return Bundle.main.loadNibNamed(nib, owner: nil, options: nil)?.first as! Self
     }
     */
    static func loadNib(_ nibNmae :String? = nil) -> Self{
        return Bundle.main.loadNibNamed(nibNmae ?? "\(self)", owner: nil, options: nil)?.first as! Self
    }
}
