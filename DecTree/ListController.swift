//
//  ListController.swift
//  DecTree
//
//  Created by Jon Toews on 8/1/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation
import UIKit

class CustomTableCell: UITableViewCell {
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        /*
        var label2 = UILabel(frame: CGRectMake(0, 10, 120, 20))
        // label2.center = CGPointMake(160, 284)
        label2.textAlignment = NSTextAlignment.Center
        label2.text = "Decision"
       // label2.backgroundColor = UIColor.redColor()
        self.contentView.addSubview(label2)

*/
      /*
        
        var label = UILabel(frame: CGRectMake(270, 10, 20, 20))
        //label.center = CGPointMake(160, 284)
        label.textAlignment = NSTextAlignment.Center
        label.text = "Yes"
      //  label.backgroundColor = UIColor.grayColor()
        self.contentView.addSubview(label)
        
        
*/
        
        
        var label1 = UILabel(frame: CGRectMake(300, 10, 20, 20))
      //  label1.center = CGPointMake(160, 284)
        label1.textAlignment = NSTextAlignment.Center
        label1.text = "No"
       // label1.backgroundColor = UIColor.greenColor()
        self.contentView.addSubview(label1)
        


     //   self.contentView.addSubview(<#view: UIView#>)
        
 
        
        
        
        
        /*
        self.middleLabel = UILabel(frame: CGRectMake(10, 10, 40, 40))
     //   middleLabel.textColor = UIColor.blackColor()
        self.middleLabel.text = "Middle"
        self.contentView.addSubview(middleLabel)
        
        
        self.rightLabel = UILabel(frame: CGRectMake(10, 60, 40, 40))
     //   rightLabel.textColor = UIColor.blackColor()
        self.rightLabel.text = "Right"
        self.contentView.addSubview(rightLabel)
        
        
        self.leftLabel = UILabel(frame: CGRectMake(10, 100, 40, 40))
    //    leftLabel.textColor = UIColor.blackColor()
        self.leftLabel.text = "Left"
        self.contentView.addSubview(leftLabel)
        */
        
      //  [nameLabel setTextColor:[UIColor blackColor]];
      //  [nameLabel setBackgroundColor:[UIColor colorWithHue:32 saturation:100 brightness:63 alpha:1]];
      //  [nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
      //  [nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
      //  [self.contentView addSubview:nameLabel];
        
      ///  mainLabel = [[UILabel alloc] init];
      //  [mainLabel setTextColor:[UIColor blackColor]];
      //  [mainLabel setBackgroundColor:[UIColor colorWithHue:66 saturation:100 brightness:63 alpha:1]];
      //  [mainLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:18.0f]];
    //    [mainLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
   //     [self.contentView addSubview:mainLabel];
        
        
        
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

    
}



class ListController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var items: [String] = ["Monkey", "Frog", "House Cat", "Barn Cow"]
    var toolBar: UIToolbar!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.toolBar = UIToolbar(frame:CGRectMake(0, UIScreen.mainScreen().bounds.size.height-100, UIScreen.mainScreen().bounds.size.width, 100))
       // self.toolBar.backgroundColor = UIColor.whiteColor()
        
        self.tableView = UITableView(frame: self.view.bounds)

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.scrollEnabled = false
        
        self.view.addSubview(self.tableView)
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        var backBtn: UIBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: nil)
        
        
        
        
        var bts: [AnyObject]? = [backBtn]
        
        

        
        
        
        
        toolBar.setItems(bts, animated: true)

        
        
        toolBar.barStyle = UIBarStyle.Black
        self.view.addSubview(toolBar)
        
        
        
        self.tableView.registerClass(CustomTableCell.self as AnyClass, forCellReuseIdentifier: "Cell")

    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
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
        
        
        
        var cell:UITableViewCell = self.tableView!.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        

        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
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


