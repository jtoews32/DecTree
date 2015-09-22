//
//  DecisionScrollController.swift
//  DecTree
//
//  Created by Jon Toews on 9/21/15.
//  Copyright © 2015 Jon Toews. All rights reserved.
//

import Foundation
import UIKit

class DecisionScrollController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var items: [String] = ["What is my goal for tomorrow?", "What is my goal for next week?", "What is my goal for next month?", "What is my goal for next Year?"]
    var toolBar: UIToolbar!
    
    
    override func loadView() {
        self.navigationController?.navigationBarHidden = true
        
        let frame: CGRect = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height)
        
        self.view = UIView(frame: frame)
        self.view.backgroundColor = UIColor.greenColor()
        
        let coLabel = UILabel(frame: CGRectMake(0, 20, UIScreen.mainScreen().bounds.width, 80))
        coLabel.textColor = UIColor.whiteColor()
        coLabel.backgroundColor = UIColor.blackColor()
        coLabel.text = "Choose"
        coLabel.textAlignment = .Center
        coLabel.font = UIFont(name: "ArialMT", size: 30.0)
        
        
        
        
        
        /*
        
        let tableViewFrame = CGRectMake(0, 120, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-120)
        self.tableView = UITableView(frame: tableViewFrame)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.scrollEnabled = false
        
        
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        */
        
        
        
        
        
        
       
        /*
        let buttonViewFrame: CGRect = CGRectMake(0, 120, UIScreen.mainScreen().bounds.width, 70)
        
        let buttonView = UIView(frame: buttonViewFrame)
        buttonView.backgroundColor = UIColor.grayColor()
        buttonView.addSubview(registerButton)
        buttonView.addSubview(signInButton)
        */
        
        
        self.view.addSubview(coLabel)
        // self.view.addSubview(self.tableView)
        
        
        /*
        self.view.addSubview(buttonView)
        self.view.addSubview(registerButton)
        self.view.addSubview(signInButton)
        
        self.view.addSubview(pictureView)
            */
        
    }
    
    

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        /*
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // Draw top border only on first cell
        if (indexPath.row == 0) {
        UIView *topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 1)];
        topLineView.backgroundColor = [UIColor grayColor];
        [cell.contentView addSubview:topLineView];
        }
        
        UIView *bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, cell.bounds.size.height, self.view.bounds.size.width, 1)];
        bottomLineView.backgroundColor = [UIColor grayColor];
        [cell.contentView addSubview:bottomLineView];
        */
        
        
        /*
        let identifier = "Cell"
        var cell: CustomTableCell! = self.tableView!.dequeueReusableCellWithIdentifier(identifier) as? CustomTableCell
        
        
        
        if cell == nil {
        // tableView.registerNib(UINib(nibName: "CustomCellOne", bundle: nil), forCellReuseIdentifier: identifier)
        cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? CustomTableCell
        }
        */
        
        
        //  let cell:UITableViewCell = self.
        let cell:UITableViewCell = self.tableView!.dequeueReusableCellWithIdentifier("cell")! // as! // UITableViewCell
    
        cell.textLabel?.text = self.items[indexPath.row]
       // return self.tableView!.dequeueReusableCellWithIdentifier("cell")! // as! UITableViewCell
        return cell;
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        /*
        if (indexPath.row == 0)
        {
            if (!self.pentagonViewController)
            self.pentagonViewController = [[PentagonViewController alloc] initWithNibName:nil bundle:nil];
            
            //  [self.navigationController pushViewController:self.pentagonViewController animated:YES];
            
            [[[AppDelegate get] navigationController] pushViewController:self.pentagonViewController animated:YES];
        }
        
        if (indexPath.row == 1)
        {
            if (!self.detailViewController)
            self.detailViewController = [[DetailViewController alloc] initWithNibName:nil bundle:nil];
            
            //[self.navigationController pushViewController:self.detailViewController animated:YES];
            
            
            [[[AppDelegate get] navigationController] pushViewController:self.detailViewController animated:YES];
        }
        
        if (indexPath.row == 2)
        {
            if (!self.collectionViewController)
            self.collectionViewController = [[CollectionViewController alloc] initWithNibName:nil bundle:nil];
            
            //     self.collectionViewController.view.backgroundColor = [UIColor greenColor];
            
            // [self.navigationController pushViewController:self.collectionViewController animated:YES];
            
            [[[AppDelegate get] navigationController] pushViewController:self.collectionViewController animated:YES];
        }
        
        
        if (indexPath.row == 3)
        {
            if (!self.customScrollViewController)
            self.customScrollViewController = [[CustomScrollViewController alloc] initWithNibName:nil bundle:nil];
            
            // [self.navigationController pushViewController:self.customScrollViewController animated:YES];
            
            [[[AppDelegate get] navigationController] pushViewController:self.customScrollViewController animated:YES];
        }
        
        */
        
        
        
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            // remove the deleted item from the model
            self.items.removeAtIndex(indexPath.row)
            
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
        }
        
        
    }
    
    func addItem() {
        /*
        
        NSIndexPath *indexPath;
        CustomTableViewCell *cell;
        
        NSInteger sectionCount = [tableView numberOfSections];
        for (NSInteger section = 0; section < sectionCount; section++) {
        NSInteger rowCount = [tableView numberOfRowsInSection:section];
        for (NSInteger row = 0; row < rowCount; row++) {
        indexPath = [NSIndexPath indexPathForRow:row inSection:section];
        cell = [tableView cellForRowAtIndexPath:indexPath];
        NSLog(@"Section %@ row %@: %@", @(section), @(row), cell.textField.text);
        }
        }
        
        
        // var indxPaths:[AnyObject]? = self.tableView.indexPathsForVisibleRows()
        // self.tableView.indexPathForCell(<#cell: UITableViewCell#>)
        //  NSIndexPath.
        
        
        */
        
        
        var currentCount = self.items.count;
        var indxPath:[NSIndexPath] = [NSIndexPath]()
        indxPath.append(NSIndexPath(forRow:currentCount,inSection:0));
        
        
        
        self.items.append("Added")
        
        self.tableView.beginUpdates()
        
        self.tableView.insertRowsAtIndexPaths(indxPath, withRowAnimation: UITableViewRowAnimation.Bottom)
        
        self.tableView.endUpdates()
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        
        return true;
    }
    
    
    

}
