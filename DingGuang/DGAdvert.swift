//
//  DGAdvert.swift
//  DingGuang
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 dingguangiPhone. All rights reserved.
//

import Foundation


class DGAdvertViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
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
        return 6;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("advertCell", forIndexPath: indexPath)
        cell.bounds = self.view.bounds
        let imageView = UIImageView(image: UIImage(named: "advert1"))
        imageView.frame = cell.bounds
        cell.contentView.addSubview(imageView)
//        cell.contentView.backgroundColor = UIColor.redColor()
//        print(cell.contentView.subviews)
        return cell
    }
    
    
    
//MARK: - 隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

//MARK: - 自定义CollectionView布局
class DGAdvertFlowLayout: UICollectionViewFlowLayout {
    var itemX :CGFloat = 0.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.minimumLineSpacing = 0;
        //这列可以用UISCreen来替代
       
        self.itemSize = CGSizeMake(UIScreen.mainScreen().bounds.width,UIScreen.mainScreen().bounds.height)
        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
        
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        //这个rect不准，要用可视范围
        let attributes = super.layoutAttributesForElementsInRect(rect)
        
        // 可视范围
        let visibleRect = CGRectMake((self.collectionView?.contentOffset.x)!, (self.collectionView?.contentOffset.y)!, (self.collectionView?.bounds.size.width)!, (self.collectionView?.bounds.size.height)!)
        let array = super.layoutAttributesForElementsInRect(visibleRect)
        
        let centerItem = array![0]
        itemX = centerItem.frame.origin.x
        
        return attributes
    }
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        //1. 手一松开，CollectionView的offset值
        let currentOffset =  self.collectionView?.contentOffset

        //往右滑
        if proposedContentOffset.x < currentOffset?.x || currentOffset?.x < 0{
            let finalPoint = CGPointMake(itemX, (currentOffset?.y)!)
            return finalPoint
        }
        else {
            let finalPoint = CGPointMake(itemX + (self.collectionView?.bounds.width)!, (currentOffset?.y)!)
            return finalPoint
        }
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

