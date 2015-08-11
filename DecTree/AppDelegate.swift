//
//  AppDelegate.swift
//  DecTree
//
//  Created by Jon Toews on 7/25/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Code for Nav Controller
        // Override point for customization after application launch.
        self.window = UIWindow(frame:UIScreen.mainScreen().bounds)
        
        
        /* UI Nav Controller */
        
        self.window!.backgroundColor = UIColor.redColor()
        
        self.window!.makeKeyAndVisible()
        
        let navController: ListNavController = ListNavController()
        self.window!.rootViewController = navController

     
        
        
        /* Background View
        let frame: CGRect = self.window!.frame
        
        let myView: DrawingView! = DrawingView(frame: frame)
        
        self.window?.addSubview(myView)
        self.window!.makeKeyAndVisible()
        */
        
        
        
        
 
        
        /* This is the drop animation
        self.window!.backgroundColor = UIColor.redColor()
        self.window!.makeKeyAndVisible()
        
        let dropController: DropViewController = DropViewController()
        self.window!.rootViewController = dropController
        */

        return true
        
        
        
        
        
        /*
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as UINavigationController
        let rootViewController:UIViewController = storyboard.instantiateViewControllerWithIdentifier("VC") as UIViewController
        navigationController.viewControllers = [rootViewController]
        self.window?.rootViewController = navigationController
        return true
        */
        
        
        
        // Override point for customization after application launch.
        
        // _scriptEngine = [[INWScript alloc] init];
        /*

        NSLog(@"Starting Storage");
        //This has to go first so that all the settings can be read first
        NSLog(@"Initializing script engine");
        _scriptEngine = [[INWScript alloc] init];
        NSLog(@"Initializing model controller");
        _modelController = [[INWModelController alloc] init:_scriptEngine];
        NSLog(@"Initializing databases");
        [self dbInit];
        NSLog(@"Initializing navigation controller");
        _navController = [[INWNavigationController alloc] init];
        NSLog(@"Initializing lesson data model");
        [[_scriptEngine m] callFunctionNamed:@"lessoninit"];

        */
        
        /*


        NSLog(@"Starting UI");
        NSDictionary *sideDrawerScreen = [_scriptEngine getScreens][@"sideDrawer"];
        INWProceduralView *sideDrawerController = [[INWProceduralView alloc] initWithTemplate:sideDrawerScreen];
        self.drawerController = [[INWDrawerController alloc] initWithCenterViewController:_navController
        leftDrawerViewController:sideDrawerController];
        self.drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeNone;
        self.drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView
        | MMCloseDrawerGestureModeTapCenterView
        | MMCloseDrawerGestureModePanningNavigationBar;
        
        NSNumber* drawerWidth = sideDrawerScreen[@"width"];
        if (drawerWidth == nil) {
        drawerWidth = [NSNumber numberWithFloat:280.0f];
        }
        self.drawerController.maximumLeftDrawerWidth = [drawerWidth floatValue];
        
        NSDictionary* events = [sideDrawerScreen objectForKey:@"events"];
        if (events != nil) {
        NSDictionary* onHide = [events objectForKey:@"onHide"];
        if (onHide != nil) {
        _onDrawerHideScript = [onHide objectForKey:@"script"];
        }
        
        NSDictionary* onShow = [events objectForKey:@"onShow"];
        if (onShow != nil) {
        _onDrawerShowScript = [onShow objectForKey:@"script"];
        }
        }
        
        [self.window setRootViewController:self.drawerController];
        
        if (_longBootMode) {
        [[NSRunLoop mainRunLoop] addTimer:[NSTimer timerWithTimeInterval:1 target:self selector:@selector(finishStartup) userInfo:nil repeats:FALSE] forMode:NSRunLoopCommonModes];
        }

*/
        /*
        var rootViewController = self.window!.rootViewController
        
        
        // UIApplication.sharedApplication().delegate
        
        
        window!.rootViewController = centerContainer
        window!.makeKeyAndVisible()
        
        return true
*/
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

