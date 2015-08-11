//
//  LuaScript.swift
//  DecTree
//
//  Created by Jon Toews on 7/25/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation

/*
#import "INWScript.h"
#import "INWModelController.h"
#import "INWProceduralView.h"
#import "INWAppDelegate.h"
#import "INWDateBridge.h"
#import "INWInAppPurchaseView.h"
#import "INWAPI.h"
#import "INWActivityDatabase.h"

@implementation INWScript

-(id) initMinimal {
self = [super init];
if (self) {
_luaManager = [[LuaManager alloc] init];
NSLog(@"Loading Script %@", @"settings.lua");
NSArray* scriptSplit = [@"settings.lua" componentsSeparatedByString:@"."];
NSString* modelPath;
if ([scriptSplit count] == 2) {
modelPath = [[NSBundle mainBundle] pathForResource:[scriptSplit objectAtIndex:0] ofType:[scriptSplit objectAtIndex:1]];
} else {
modelPath = @"settings.lua";
}
[_luaManager runCodeFromFileWithPath:modelPath];
}
return self;
}

-(id) init {
self = [super init];

if (self) {
_luaManager = [[LuaManager alloc] init];

//register binding functions with the lua manager
//UI Manipulation
[_luaManager registerFunction:l_addLabel withName:@"addLabel"];
[_luaManager registerFunction:l_addNavButton withName:@"l_addNavButton"];
[_luaManager registerFunction:view_setBackgroundImage withName:@"view_setBackgroundImage"];
[_luaManager registerFunction:l_showDrawer withName:@"l_showDrawer"];
[_luaManager registerFunction:l_hideDrawer withName:@"l_hideDrawer"];
[_luaManager registerFunction:l_alert withName:@"l_alert"];
[_luaManager registerFunction:l_log withName:@"l_log"];
[_luaManager registerFunction:l_getAppVersionString withName:@"l_getAppVersionString"];

//Model interface
[_luaManager registerFunction:model_get withName:@"model_get"];
[_luaManager registerFunction:model_put withName:@"model_put"];
[_luaManager registerFunction:model_reset withName:@"model_reset"];
[_luaManager registerFunction:l_resetApp withName:@"l_resetApp"];

//Navigation interface
[_luaManager registerFunction:nav_popView withName:@"nav_popView"];
[_luaManager registerFunction:nav_pushView withName:@"nav_pushView"];
[_luaManager registerFunction:nav_hideBar withName:@"nav_hideBar"];
[_luaManager registerFunction:nav_getCurrentViewController withName:@"nav_getCurrentViewController"];
[_luaManager registerFunction:nav_startLesson withName:@"nav_startLesson"];

//Activities
[_luaManager registerFunction:l_addActivity withName:@"l_addActivity"];

//Analytics
[_luaManager registerFunction:l_trackEvent withName:@"l_trackEvent"];
[_luaManager registerFunction:l_registerSuperProperties withName:@"l_registerSuperProperties"];
[_luaManager registerFunction:l_setPeopleProperty withName:@"l_setPeopleProperty"];

//Facebook
[_luaManager registerFunction:l_facebookLogin withName:@"l_facebookLogin"];
[_luaManager registerFunction:l_facebookGetMe withName:@"l_facebookGetMe"];
[_luaManager registerFunction:l_facebookAuthenticated withName:@"l_facebookAuthenticated"];
[_luaManager registerFunction:l_facebookLogout withName:@"l_facebookLogout"];
[_luaManager registerFunction:l_facebookShare withName:@"l_facebookShare"];

//iOS Share and Messaging
[_luaManager registerFunction:l_socialShare withName:@"l_socialShare"];
[_luaManager registerFunction:l_sendEmail withName:@"l_sendEmail"];
[_luaManager registerFunction:l_sendSMS withName:@"l_sendSMS"];

//Browser
[_luaManager registerFunction:l_openURL withName:@"l_openURL"];
[_luaManager registerFunction:l_openPDF withName:@"l_openPDF"];

//UserVoice
[_luaManager registerFunction:l_startUservoice withName:@"l_startUservoice"];

//Gravatar
[_luaManager registerFunction:l_getGravatarURL withName:@"l_getGravatarURL"];

//Local Notifications
[_luaManager registerFunction:l_rescheduleNotifications withName:@"l_rescheduleNotifications"];
[_luaManager registerFunction:l_scheduleNotification withName:@"l_scheduleNotification"];
[_luaManager registerFunction:l_cancelAllNotifications withName:@"l_cancelAllNotifications"];

//Native Bridge
[_luaManager registerFunction:l_free withName:@"l_free"];

//Date Bridge
[_luaManager registerFunction:l_getCurrentNSDate withName:@"l_getCurrentNSDate"];
[_luaManager registerFunction:date_dateByAddingTimeInterval withName:@"date_dateByAddingTimeInterval"];
[_luaManager registerFunction:date_localDescription withName:@"date_localDescription"];
[_luaManager registerFunction:l_getCalendarWithIdentifier withName:@"l_getCalendarWithIdentifier"];
[_luaManager registerFunction:calendar_getComponentsFromDate withName:@"calendar_getComponentsFromDate"];
[_luaManager registerFunction:calendar_dateFromComponents withName:@"calendar_dateFromComponents"];
[_luaManager registerFunction:dateComponents_convertToTable withName:@"dateComponents_convertToTable"];
[_luaManager registerFunction:dateComponents_convertTableToDateComponents withName:@"dateComponents_convertTableToDateComponents"];

//Date Functions
[_luaManager registerFunction:l_friendlyDate withName:@"l_friendlyDate"];
[_luaManager registerFunction:l_currentDate withName:@"l_currentDate"];
[_luaManager registerFunction:l_daysBetweenDates withName:@"l_daysBetweenDates"];
[_luaManager registerFunction:l_utcDateToLocal withName:@"l_utcDateToLocal"];

//SQLite Databases
[_luaManager registerFunction:l_activityDBQuery withName:@"l_activityDBQuery"];
[_luaManager registerFunction:l_clearDatabases withName:@"l_clearDatabases"];

//Cloud Auth
[_luaManager registerFunction:l_signInWithEmail withName:@"l_signInWithEmail"];
[_luaManager registerFunction:l_signInWithFacebook withName:@"l_signInWithFacebook"];
[_luaManager registerFunction:l_registerUserWithEmail withName:@"l_registerUserWithEmail"];
[_luaManager registerFunction:l_changePassword withName:@"l_changePassword"];
[_luaManager registerFunction:l_requestPasswordChange withName:@"l_requestPasswordChange"];

//Cloud Sync
[_luaManager registerFunction:l_uploadClientState withName:@"l_uploadClientState"];
[_luaManager registerFunction:l_downloadClientState withName:@"l_downloadClientState"];
[_luaManager registerFunction:l_getCloudStateVersion withName:@"l_getCloudStateVersion"];

[_luaManager registerFunction:l_getAuthToken withName:@"l_getAuthToken"];
[_luaManager registerFunction:l_setAuthToken withName:@"l_setAuthToken"];

//In App Purchase
[_luaManager registerFunction:l_inAppPurchase withName:@"l_inAppPurchase"];
[_luaManager registerFunction:l_dismissInAppPurchase withName:@"l_dismissInAppPurchase"];
[_luaManager registerFunction:l_restoreInAppPurchases withName:@"l_restoreInAppPurchases"];

//load the model from it's script
NSLog(@"Loading Manifest...");
NSString* manifestPath = [[NSBundle mainBundle] pathForResource:@"manifest" ofType:@"lua"];
[_luaManager runCodeFromFileWithPath:manifestPath];

NSLog(@"Loading Bundle Scripts");
NSArray* manifest = (NSArray*)[_luaManager getObjectNamed:@"manifest"];
for (NSString* scriptPath in manifest) {
NSLog(@"Loading Script %@", scriptPath);
NSArray* scriptSplit = [scriptPath componentsSeparatedByString:@"."];
NSString* modelPath;
if ([scriptSplit count] == 2) {
modelPath = [[NSBundle mainBundle] pathForResource:[scriptSplit objectAtIndex:0] ofType:[scriptSplit objectAtIndex:1]];
} else {
modelPath = scriptPath;
}
[_luaManager runCodeFromFileWithPath:modelPath];

//Merge exports
[_luaManager callFunctionNamed:@"mergeExports"];
}
}

return self;
}

-(LuaManager*) m {
return _luaManager;
}

-(NSObject*) getObjectNamed:(NSString *)name {
return [_luaManager getObjectNamed:name];
}

-(NSDictionary*) getScreens {
return (NSDictionary*)[_luaManager getObjectNamed:@"screens"];
}

-(NSArray*) getLessons {
return (NSArray*)[_luaManager getObjectNamed:@"lessons"];
}

@end

*/