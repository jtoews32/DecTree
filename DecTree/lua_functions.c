//
//  lua_functions.c
//  DecTree
//
//  Created by Jon Toews on 9/21/15.
//  Copyright © 2015 Jon Toews. All rights reserved.
//

#include "lua_functions.h"


int model_get(lua_State *L) {
    
    
    
    /*
    INWModelController* mc = [[INWAppDelegate get] getModelController];
    NSString* key = [NSString stringWithUTF8String:lua_tostring(L, 1)];
    NSObject* result = [mc getModelElement:key];
    NSDictionary* definition = [mc getModelDefinition:key];
    writeIntoLua(result, definition, L);
     */
    return 1;
}

int model_put(lua_State *L) {
    // NSLog("Now What")
    
    const char *s = lua_tostring(L, 1);   /* any Lua string */
    //size_t l = lua_strlen(L, 1);          /* its length */
    
    
    
    
    
    /*
    INWModelController* mc = [[INWAppDelegate get] getModelController];
    NSString* key = [NSString stringWithUTF8String:lua_tostring(L, 1)];
    NSObject* value = [mc retrieveObjectAt:2 withState:L];
    [mc putModelElement:key withValue:value];
    [mc persistData];
     */
    
    
    return 0;
}