//
//  ViewController.swift
//  DecTree
//
//  Created by Jon Toews on 7/25/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import UIKit

class ViewController: UIViewController /*, UITableViewDataSource, UITableViewDelegate*/ {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /*
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet var tableView: UITableView!
    
    var databasePath = "";
    let textCellIdentifier = "TextCell"
    var arrayOfNames = [""]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        createOpenPersonDB()
        // populateArrayOfName()
    }
    
    
    @IBAction func addUser(sender: AnyObject) {
        
        let personDB = FMDatabase(path: databasePath as String)
        
        if personDB.open() {
            
            let phone = "000-000-0000"
            
            let insertSQL = "INSERT INTO NAMES (firstname, lastname, phone) VALUES ('\(firstname.text)', '\(lastname.text)', '\(phone)')"
            
            let result = personDB.executeUpdate(insertSQL,
                withArgumentsInArray: nil)
            
            if !result {
                println("Error: \(personDB.lastErrorMessage())")
            } else {
                firstname.text = ""
                lastname.text = ""
            }
            
            personDB.close()
            //    populateArrayOfName()
        } else {
            println("Error: \(personDB.lastErrorMessage())")
        }
    }
    
    func createOpenPersonDB() {
        
        let filemgr = NSFileManager.defaultManager()
        let dirPaths =
        NSSearchPathForDirectoriesInDomains(.DocumentDirectory,
            .UserDomainMask, true)
        
        let docsDir = dirPaths[0] as! String
        
        self.databasePath = docsDir.stringByAppendingPathComponent("person.db")
        
        
        if !filemgr.fileExistsAtPath(databasePath as String) {
            
            
            let personDB = FMDatabase(path: databasePath as String)
            
            if personDB == nil {
                println("Error: \(personDB.lastErrorMessage())")
            }
            
            if personDB.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS NAMES (ID INTEGER PRIMARY KEY AUTOINCREMENT, FIRSTNAME TEXT, LASTNAME TEXT, PHONE TEXT)"
                if !personDB.executeStatements(sql_stmt) {
                    println("Error: \(personDB.lastErrorMessage())")
                }
                
                
                personDB.close()
            } else {
                println("Error: \(personDB.lastErrorMessage())")
            }
            
        }
    }
    
    
    func populateArrayOfName() {
        let personDB = FMDatabase(path: databasePath as String)
        
        if personDB.open() {
            
            arrayOfNames.removeAll(keepCapacity:false)
            
            let selectSQL = "select * from names"
            
            if let resultSet = personDB.executeQuery(selectSQL, withArgumentsInArray:nil) {
                while resultSet.next() {
                    // println(resultset.resultDictionary())
                    var firstname = resultSet.stringForColumn("firstname")
                    var lastname = resultSet.stringForColumn("lastname")
                    
                    arrayOfNames.append("\(firstname) \(lastname)")
                }
            } else {
                println("select failure: \(personDB.lastErrorMessage())")
            }
            
            
            personDB.close()
            self.tableView.reloadData()
            
        } else {
            println("Error: \(personDB.lastErrorMessage())")
        }
        
    }
    
    @IBAction func deleteAll(sender: AnyObject) {
        let personDB = FMDatabase(path: databasePath as String)
        
        if personDB.open() {
            
            arrayOfNames.removeAll(keepCapacity:false)
            
            let deleteSQL = "delete from names where id > 0"
            
            
            personDB.executeUpdate(deleteSQL, withArgumentsInArray: nil)
            
       
//            if let resultSet = personDB.executeQuery(selectSQL, withArgumentsInArray:nil) {
 //           while resultSet.next() {
            // println(resultset.resultDictionary())
//            var firstname = resultSet.stringForColumn("firstname")
//            var lastname = resultSet.stringForColumn("lastname")
            
//            arrayOfNames.append("\(firstname) \(lastname)")
//            }
//            } else {
//            println("select failure: \(personDB.lastErrorMessage())")
//            }

            
            personDB.close()
            self.tableView.reloadData()
            
        } else {
            println("Error: \(personDB.lastErrorMessage())")
        }
        
    }
    
    
    
    @IBAction func displayUsers(sender: AnyObject) {
        populateArrayOfName()
    }
    
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // dequeueReusableCellWithIdentifier:forIndexPath:
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier:"TextCell")
        
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
        
        
        let row = indexPath.row
        cell.textLabel?.text = arrayOfNames[row]
        
        return cell
        
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        println(arrayOfNames[row])
    }
    
    */
}