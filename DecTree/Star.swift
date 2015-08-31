//
//  Star.swift
//  DecTree
//
//  Created by Jon Toews on 8/25/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation

@objc(Star)
class Star: CBLModel {
    @NSManaged var observations: NSArray // items are NSDates
    class func observationsItemClass() -> AnyClass {
        return NSDate.self
    }
}

