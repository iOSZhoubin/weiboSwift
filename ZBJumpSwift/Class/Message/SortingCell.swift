//
//  SortingCell.swift
//  PatternBusiness
//
//  Created by 乔木 on 2018/6/12.
//  Copyright © 2018年 乔木. All rights reserved.
//

import UIKit

class SortingCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    @IBOutlet weak var sortingContentView: UICollectionView!
   
    let layout = UICollectionViewFlowLayout()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layout.itemSize = CGSize(width: 60*proportionWidth, height: 80*proportionWidth)
        layout.minimumLineSpacing = 5*proportionWidth
        layout.minimumInteritemSpacing = 15*proportionWidth
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.sectionInset = UIEdgeInsetsMake(10*proportionWidth, 20*proportionWidth, 10*proportionWidth, 20*proportionWidth)
        
        sortingContentView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 300*proportionWidth)
        sortingContentView.delegate = self
        sortingContentView.dataSource = self
        sortingContentView.collectionViewLayout = layout
        sortingContentView.register(UINib.init(nibName: "SortingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "sortingCollectionViewCell")
        
    }
    


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "sortingCollectionViewCell", for: indexPath) as! SortingCollectionViewCell
        
        collectionCell.titleLB.text = "西安"

        return collectionCell
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
