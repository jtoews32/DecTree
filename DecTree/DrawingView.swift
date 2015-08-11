//
//  DrawingView.swift
//  DecTree
//
//  Created by Jon Toews on 8/8/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation
import UIKit

class DrawingView: UIView {
    
    var button: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.grayColor()
        
        button = UIButton(frame: CGRectMake(220, 360, 80, 44))
        button.setTitle("Test", forState: UIControlState.Normal)
        
        
     //   button.addTarget(<#target: AnyObject?#>, action: <#Selector#>, forControlEvents: <#UIControlEvents#>)
    
 /*
        self = [super initWithFrame:frame];
        if (self) {
        [self setBackgroundColor:[UIColor lightGrayColor]];
        //The button will be a plain colored rectangle with a title.
        //No shading, no shape, no image.
        button = [[UIButton alloc]initWithFrame:CGRectMake(220, 360, 80, 44)];
        [button setTitle:@"Rotate" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonHit:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundColor:[UIColor redColor]];
        [button setShowsTouchWhenHighlighted:YES];
        
        [self addSubview:button];
        
        //For the more elaborate animations we must deal with a CAShapeLayer which we add to this UIView.
        shapeLayer = [CAShapeLayer layer];
        [[self layer] addSublayer:shapeLayer];
        
        
        }
        return self;


*/
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}