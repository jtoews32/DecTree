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
        self.navigationController?.navigationBarHidden = true
        let frame: CGRect = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        
        self.view = UIView(frame: frame)
        self.view.backgroundColor = UIColor.whiteColor()
 /*
        let image = UIImage(named:"500x500_1.png")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 20, width: UIScreen.mainScreen().bounds.width, height: 300)
 */

        let image2 = UIImage(named:"500x500_2.png")
        let imageView2 = UIImageView(image: image2!)
        imageView2.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 300)
        
 /*
        let image3 = UIImage(named:"500x500_3.png")
        let imageView3 = UIImageView(image: image3!)
        imageView3.frame = CGRect(x: UIScreen.mainScreen().bounds.width, y: 0, width: UIScreen.mainScreen().bounds.width, height: 300)
*/

        
        let coLabel = UILabel(frame: CGRectMake(0, 20, UIScreen.mainScreen().bounds.width, 100))
        coLabel.textColor = UIColor.whiteColor()
        coLabel.backgroundColor = UIColor.blackColor()
        coLabel.text = "Decision Tree"
        coLabel.textAlignment = .Center
        coLabel.font = UIFont(name: "ArialMT", size: 30.0)

        
        let registerButton = UIButton()
        
        registerButton.setTitle("Sign In", forState: .Normal)
        registerButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        registerButton.frame = CGRectMake(20, 130, 100, 50)
        registerButton.backgroundColor = UIColor.greenColor()
        registerButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        
        registerButton.layer.cornerRadius = 5
        registerButton.layer.masksToBounds = true
        
        let signInButton = UIButton()
        
        signInButton.setTitle("Register", forState: .Normal)
        signInButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        signInButton.frame = CGRectMake(UIScreen.mainScreen().bounds.width - 100 - 20, 130, 100, 50)
        signInButton.backgroundColor = UIColor.greenColor()
        signInButton.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        
        signInButton.layer.cornerRadius = 5
        signInButton.layer.masksToBounds = true
        
        let buttonViewFrame: CGRect = CGRectMake(0, 120, UIScreen.mainScreen().bounds.width, 70)
        
        let buttonView = UIView(frame: buttonViewFrame)
        buttonView.backgroundColor = UIColor.yellowColor()
        buttonView.addSubview(registerButton)
        buttonView.addSubview(signInButton)

        
        let imageFrame: CGRect = CGRectMake(0, 190, UIScreen.mainScreen().bounds.width, 300)
        
        let pictureView = UIView(frame: imageFrame)
        pictureView.backgroundColor = UIColor.blackColor()
        pictureView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        
        pictureView.addSubview(imageView2)

        self.view.addSubview(coLabel)
        self.view.addSubview(buttonView)
        self.view.addSubview(registerButton)
        self.view.addSubview(signInButton)
        
        self.view.addSubview(pictureView)

    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }

}

