//
//  ListNavController.swift
//  DecTree
//
//  Created by Jon Toews on 8/1/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation
import UIKit

class ListNavController: UINavigationController {  // Navigation
    
    var controller: ListController?
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.controller = ListController()
        
        self.pushViewController(self.controller!, animated: true )
        
        
        var addButton: UIButton = UIButton(frame: CGRectMake(0,0,100,60))
        addButton.setTitle("Add", forState: UIControlState.Normal)
        addButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25.0)
        addButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal) //, forState: UIControlState.Normal)
        addButton.addTarget(self, action: "addPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        addButton.backgroundColor = UIColor.whiteColor()

        self.view.addSubview(addButton)
        
        
        
        
        
        
        var deleteButton: UIButton = UIButton(frame: CGRectMake(140,0,100,60))
        deleteButton.setTitle("Delete", forState: UIControlState.Normal)
        deleteButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25.0)
        deleteButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal) //, forState: UIControlState.Normal)
        deleteButton.addTarget(self, action: "deletePressed:", forControlEvents: UIControlEvents.TouchUpInside)
        
        deleteButton.backgroundColor = UIColor.whiteColor()

        self.view.addSubview(deleteButton)
        
        
        
        
        

        var editButton: UIButton = UIButton(frame: CGRectMake(280,0,100,60))
        editButton.setTitle("Edit", forState: UIControlState.Normal)
        editButton.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 25.0)
        editButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal) //, forState: UIControlState.Normal)
        editButton.addTarget(self, action: "editPressed:", forControlEvents: UIControlEvents.TouchUpInside)
   
        editButton.backgroundColor = UIColor.whiteColor()
        
        self.view.addSubview(editButton)
        
        
    }
    

    
    @IBAction func addPressed(sender: UIButton) {
        self.controller?.tableView.setEditing(false, animated: true)
        self.controller?.addItem()
    }
    
    @IBAction func deletePressed(sender: UIButton) {
        self.controller?.tableView.setEditing(true, animated: true)
    }
    
    @IBAction func editPressed(sender: UIButton) {
        self.controller?.tableView.setEditing(false, animated: true)
    }
    
    
}
