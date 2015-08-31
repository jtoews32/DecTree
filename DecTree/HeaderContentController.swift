//
//  HeaderContentController.swift
//  DecTree
//
//  Created by Jon Toews on 8/13/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation
import UIKit

class HeaderContentController: UIViewController, UIScrollViewDelegate {

    override func loadView() {
        
        let frame: CGRect = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        
        self.view = UIView(frame: frame)
        self.view.backgroundColor = UIColor.grayColor()
 
        let image = UIImage(named:"500x500_1.png")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 20, width: UIScreen.mainScreen().bounds.width, height: 300)
        

        let image2 = UIImage(named:"500x500_2.png")
        let imageView2 = UIImageView(image: image2!)
        imageView2.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 300)
        
 
        let image3 = UIImage(named:"500x500_3.png")
        let imageView3 = UIImageView(image: image3!)
        imageView3.frame = CGRect(x: UIScreen.mainScreen().bounds.width, y: 0, width: UIScreen.mainScreen().bounds.width, height: 300)
   
        
        
        let frameScroller: CGRect = CGRectMake(0, 340, UIScreen.mainScreen().bounds.width, 300)
        
        let scrollView = UIScrollView(frame: frameScroller)
        scrollView.backgroundColor = UIColor.blackColor()
     //   scrollView.contentSize = CGSize(width: 200, height: 200) // imageView2.bounds.size
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        scrollView.addSubview(imageView2)
       // scrollView.addSubview(imageView3)
        
        scrollView.delegate = self
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 10.0
        scrollView.zoomScale = 1.0
        
        
        scrollView.contentSize = imageView.frame.size
        
     //   self.view.addSubview(imageView)
        self.view.addSubview(scrollView)
        
        
        // self.view.addSubview(imageView2)
        
    }
    
    


}

