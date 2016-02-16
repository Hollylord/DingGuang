//
//  DGAdvert.swift
//  DingGuang
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 dingguangiPhone. All rights reserved.
//

import Foundation


class DGAdvertViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    @IBOutlet weak var advertCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.advertCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "advertCell")
        
        
    }
    
    //MARK: - 代理
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("advertCell", forIndexPath: indexPath)
        cell.bounds = self.view.bounds
        let imageView = UIImageView(image: UIImage(named: "advert1"))
        imageView.frame = cell.bounds
        cell.contentView.addSubview(imageView)
//        cell.contentView.backgroundColor = UIColor.redColor()
        print(cell.contentView.subviews)
        return cell
    }
    
    //MARK: - 设置状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}


//class DGAdvertView: UIImageView {
//    //加required是因为这是指定初始化器,表示子类要继承这个方法
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
////        self.image = UIImage(named: "advert1")
//        
//    }
//    
//}

//class DGCartoonView: UIImageView {
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        self.image = UIImage(named: "design")
//        let scaleTransform = CGAffineTransformMakeScale(3, 3)
//        let rotationTransform = CGAffineTransformMakeRotation( CGFloat(M_PI) )
//        
//        self.transform = CGAffineTransformConcat(scaleTransform ,rotationTransform)
//        
//        UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
//            self.transform = CGAffineTransformIdentity
//            }, completion: nil)
//    }
//    
//    
//}

