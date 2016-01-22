//
//  DGAdvert.swift
//  DingGuang
//
//  Created by apple on 16/1/21.
//  Copyright © 2016年 dingguangiPhone. All rights reserved.
//

import Foundation
class DGAdvertViewController: UIViewController {
    override func viewDidLoad() {
        
    }
}

class DGAdvertView: UIImageView {
    //加required是因为这是指定初始化器,表示子类要继承这个方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        self.image = UIImage(named: "advert1")
        
    }
    
}

class DGCartoonView: UIImageView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.image = UIImage(named: "design")
        let scaleTransform = CGAffineTransformMakeScale(3, 3)
        let rotationTransform = CGAffineTransformMakeRotation( CGFloat(M_PI) )
        
        self.transform = CGAffineTransformConcat(scaleTransform ,rotationTransform)
        
        UIView.animateWithDuration(0.8, delay: 0, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    
}