//
//  DropViewController.swift
//  DecTree
//
//  Created by Jon Toews on 8/8/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation
import UIKit



class DropViewController: UIViewController {
    // @IBOutlet weak var mainView: DrawingView!
    
    var dropPerRow = 6
    let gravity = UIGravityBehavior()
    
    lazy var animator: UIDynamicAnimator = {
        let lazyDynamicaAnimator = UIDynamicAnimator(referenceView: self.view)
        return lazyDynamicaAnimator
    }()
    
    
    lazy var collider: UICollisionBehavior = {
        let lazyCreateCollider = UICollisionBehavior()
        lazyCreateCollider.translatesReferenceBoundsIntoBoundary = true
        return lazyCreateCollider
    }()
    
    
    
    
    override func loadView() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let frame: CGRect = UIScreen.mainScreen().bounds
        
        self.view = UIView(frame: frame)
        self.view.backgroundColor = UIColor.grayColor()
        
        let singleTap: UITapGestureRecognizer! = UITapGestureRecognizer(target: self, action:"tapped")
 
        self.view.addGestureRecognizer(singleTap)
        
        self.animator.addBehavior(self.gravity)
        self.animator.addBehavior(self.collider)
        
 
    }
    
    func tapped () {
        drop()
    }
    
    var dropSize: CGSize {
        let size = self.view.bounds.size.width / CGFloat(dropPerRow)
        return CGSize(width: size, height: size)
        
    }
    
    func drop() {
        var frame = CGRect(origin: CGPointZero, size: dropSize)
        frame.origin.x = CGFloat.random(dropPerRow) * dropSize.width

        let dropView: UIView! = UIView(frame: frame)
        
        dropView.backgroundColor = UIColor.random
        
        dropView.layer.cornerRadius = 5
        dropView.layer.masksToBounds = true
     
        
        var red = UIColor(red: 100.0, green: 100.0, blue: 100.0, alpha: 1.0)
        dropView.layer.borderColor = red.CGColor
       
        
        
        dropView.layer.borderWidth = 1
        
        

        
        self.view.addSubview(dropView)
        
        self.gravity.addItem(dropView)
        self.collider.addItem(dropView)
        
    }
    
    
}

private extension CGFloat {
    static func random(max: Int) -> CGFloat {
        return CGFloat(arc4random() % UInt32(max))
    }
    
}

private extension UIColor {
    class var random: UIColor {
        switch arc4random() % 5 {
        case 0: return UIColor.greenColor()
        case 1: return UIColor.blueColor()
        case 2: return UIColor.orangeColor()
        case 3: return UIColor.redColor()
        case 4: return UIColor.purpleColor()
        default: return UIColor.blackColor()
        }
    }
}