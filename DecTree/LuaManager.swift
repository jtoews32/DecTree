//
//  LuaManager.swift
//  DecTree
//
//  Created by Jon Toews on 7/25/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

/*


NSString* startScreen = (NSString*)[[_scriptEngine m] callFunctionNamedWithReturnValue:@"chooseStartScreen" andParameter:nil];
[self pushView:startScreen isNewRoot:TRUE];



*/




import Foundation

// typealias EvalResult = (code: Int32, results: [String])


class LuaManager {
    
    
    let state: COpaquePointer
    
    init()
    {
        state = luaL_newstate()
        luaL_openlibs(state)
        lua_settop(state, 0)
    }
    
    
    func runCodeFromString(script: String) {
        // Get state
        let L: COpaquePointer = self.state

       // var results: [String] = []
        
       // lua_settop(L, 0)
        
        
        /*
        
        // compile
        int error = luaL_loadstring(L, to_cString(code));
        if (error) {
        NSString* stackTrace = to_nsString(lua_tostring(L, -1));
        [[INWAppDelegate get] exit:stackTrace];
        return;
        }
        */
        
        
        var error = luaL_loadstring(L, script)
        if error != LUA_OK
        {
            let msg = String(UTF8String: lua_tolstring(L, -1, nil))
            
            if let errmsg = msg
            {
                // results.append(errmsg)
            }
            
            return; // (error, results)
        }
        
        /*

        // run
        error = lua_pcall(L, 0, 0, 0);
        if (error) {
        NSString* stackTrace = to_nsString(lua_tostring(L, -1));
        [[INWAppDelegate get] exit:stackTrace];
        return;
        }
        }

        */
        
        error = lua_pcallk(L, 0, LUA_MULTRET, 0, 0, nil)
        if error != LUA_OK
        {
            let msg = String(UTF8String: lua_tolstring(L, -1, nil))
            
            if let errmsg = msg
            {
              //  results.append(errmsg)
            }
            
            return; // (error, results)
        }
    }
    
        
    
    func runCodeFromStringWithResult(script: String) -> EvalResult
    {
        let L: COpaquePointer = self.state
        
        
        var results: [String] = []
        
        lua_settop(L, 0)
        
        
        var err = luaL_loadstring(L, script)
        if err != LUA_OK
        {
            let msg = String(UTF8String: lua_tolstring(L, -1, nil))
            
            if let errmsg = msg
            {
                results.append(errmsg)
            }
            
            return (err, results)
        }
        
        
        err = lua_pcallk(L, 0, LUA_MULTRET, 0, 0, nil)
        if err != LUA_OK
        {
            let msg = String(UTF8String: lua_tolstring(L, -1, nil))
            
            if let errmsg = msg
            {
                results.append(errmsg)
            }
            
            return (err, results)
        }
        
        
        let nresults = lua_gettop(L)
        if nresults != 0
        {
            for var i = nresults; i > 0; i--
            {
                let msg = String(UTF8String: lua_tolstring(L, -1 * i, nil))
                
                if let errmsg = msg
                {
                    results.append(errmsg)
                }
            }
            
            lua_settop(L, -(nresults)-1) // can't use lua_pop since it's a #define
        }
        
        
        return (LUA_OK, results)
    }
    
    
    func runCodeFromFileWithPath(path: String) {
        let L: COpaquePointer = self.state
        
        var error = luaL_loadfilex(L,path, nil)
        
        if error != LUA_OK {
           // NSString* stackTrace = to_nsString(lua_tostring(L, -1));
           // [[INWAppDelegate get] exit:stackTrace];
            return
        }
        
        // run
        error = lua_pcallk(L, 0, LUA_MULTRET, 0, 0, nil)
        if error != LUA_OK {
           // NSString* stackTrace = to_nsString(lua_tostring(L, -1));
           // [[INWAppDelegate get] exit:stackTrace];
            return
        }
 
    
    
        
        
    /*
 
    
    // compile
    int error = luaL_loadfile(L, to_cString(path));
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return;
    }
    
    // run
    error = lua_pcall(L, 0, 0, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return;
    }
    }
    */
    }


    func registerFunction(function: lua_CFunction, name: String) {
    
       // Original: lua_register(self.state, to_cString(name), function);
        lua_pushcclosure(self.state, function, 0)
        lua_setglobal(self.state, name )
        
        
        
        // #define lua_register(L,n,f) (lua_pushcfunction(L, (f)), lua_setglobal(L, (n)))

    }
    
    
    
    func callFunctionNamed(name: String) {
        let L: COpaquePointer = self.state
        
        lua_getglobal(L, name )
        
        var error = lua_pcallk(L, 0, LUA_MULTRET, 0, 0, nil)
        if error != LUA_OK
        {
            let msg = String(UTF8String: lua_tolstring(L, -1, nil))
            
            if let errmsg = msg
            {
                //  results.append(errmsg)
            }
            
            return; // (error, results)
        }
        
        
        
    
    /*


    - (void)callFunctionNamed:(NSString *)name {
        // get state
        lua_State *L = self.state;
    
        // prepare for "function(object)"
        lua_getglobal(L, to_cString(name));
    
        // run
        int error = lua_pcall(L, 0, 0, 0);
        if (error) {
                NSString* stackTrace = to_nsString(lua_tostring(L, -1));
            [[INWAppDelegate get] exit:stackTrace];
            return;
            }
    }
    


*/
    }
    
    
    
    
    func callFunctionNamed(name: String, object: COpaquePointer) {
        let L: COpaquePointer = self.state
        
        lua_getglobal(L, name )
        
        /*
        if object    [  object isKindOfClass:[UIViewController class]]) {
            lua_pushlightuserdata(L, (__bridge void*)(object));
        } else {
            writeIntoLua(object, nil, L);
        }
        
        */
        
        
        var error = lua_pcallk(L, 1, LUA_MULTRET, 0, 0, nil)
        if error != LUA_OK
        {
            let msg = String(UTF8String: lua_tolstring(L, -1, nil))
            
            if let errmsg = msg
            {
                //  results.append(errmsg)
            }
            
            return; // (error, results)
        }
        
        
        
        
        
        /*
        
        
        - (void)callFunctionNamed:(NSString *)name withObject:(NSObject *)object {
        // get state
        lua_State *L = self.state;
        
        // prepare for "function(object)"
        lua_getglobal(L, to_cString(name));
        
        // load parameter onto stack
        if ([object isKindOfClass:[UIViewController class]]) {
            lua_pushlightuserdata(L, (__bridge void*)(object));
        } else {
            writeIntoLua(object, nil, L);
        }
        
        // run
        int error = lua_pcall(L, 1, 0, 0);
        if (error) {
        NSString* stackTrace = to_nsString(lua_tostring(L, -1));
        [[INWAppDelegate get] exit:stackTrace];
        return;
        }
        
        
        
        
        
        
        */
    }
    
    
    
    /*
    -(void) callFunctionNamed:(NSString*)name withObjects:(NSArray*)objects {
    // get state
    lua_State *L = self.state;
    
    // prepare for "function(object)"
    lua_getglobal(L, to_cString(name));
    
    // load parameter onto stack
    for (NSObject* object in objects) {
    if ([object isKindOfClass:[UIViewController class]]) {
    lua_pushlightuserdata(L, (__bridge void*)(object));
    } else {
    writeIntoLua(object, nil, L);
    }
    }
    
    // run
    int error = lua_pcall(L, [objects count], 0, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return;
    }
    }
    
    */
    
    
    
    
    
    
    
    
    

    
    /*
    
    -(NSObject*) callFunctionNamedWithReturnValue:(NSString*)name withObjects:(NSArray*)objects {
    // get state
    lua_State *L = self.state;
    
    // prepare for "function(object)"
    lua_getglobal(L, to_cString(name));
    
    // load parameter onto stack
    for (NSObject* object in objects) {
    if ([object isKindOfClass:[UIViewController class]]) {
    lua_pushlightuserdata(L, (__bridge void*)(object));
    } else {
    writeIntoLua(object, nil, L);
    }
    }
    
    // run
    int error = lua_pcall(L, [objects count], 0, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return nil;
    }
    
    NSObject* result = [self retrieveObjectAt:-1];
    
    return result;
    }
    */
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    -(NSObject*)callFunctionNamedWithReturnValue:(NSString*)name andParameter:(NSObject*)parameter {
    // get state
    lua_State *L = self.state;
    
    lua_getglobal(L, to_cString(name));
    
    // load parameter onto stack
    if ([parameter isKindOfClass:[UIViewController class]]) {
    lua_pushlightuserdata(L, (__bridge void*)(parameter));
    } else {
    writeIntoLua(parameter, nil, L);
    }
    
    // run
    int error = lua_pcall(L, 1, 1, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return nil;
    }
    
    NSObject* result = [self retrieveObjectAt:-1];
    
    return result;
    }
    */
    
    
    
    
    
    
    
    
    /*
    - (NSObject*) retrieveObjectAt:(int)luaIndex {
    lua_State* L = self.state;
    
    if (lua_gettop(L) < luaIndex) {
    NSLog(@"WARNING: attempted to get an object at an illegal index");
    return nil;
    }
    
    int type = lua_type(L, luaIndex);
    
    NSObject* returnVal = nil;
    
    switch (type) {
    case LUA_TNIL: {
    returnVal = nil;
    } break;
    
    case LUA_TBOOLEAN: {
    returnVal = [NSNumber numberWithBool:lua_toboolean(L, luaIndex)];
    } break;
    
    case LUA_TSTRING: {
    returnVal = to_nsString(lua_tostring(L, luaIndex));
    } break;
    
    case LUA_TNUMBER: {
    returnVal = [NSNumber numberWithDouble:lua_tonumber(L, luaIndex)];
    } break;
    
    case LUA_TTABLE: {
    NSMutableDictionary* results = [[NSMutableDictionary alloc] init];
    int top = luaIndex;
    if (top < 0) {
    top = lua_gettop(L);
    }
    lua_pushnil(L);
    bool convertToArray = false;
    int largestArraySubscript = 1;
    
    while (lua_next(L, top) != 0) {
    NSObject* key = [self retrieveObjectAt:-2];
    NSString* stringKey = nil;
    
    if (key != nil) {
    if ([key isKindOfClass:[NSNumber class]]) {
    convertToArray = true;
    NSNumber* numKey = (NSNumber*)key;
    stringKey = [(NSNumber*)key stringValue];
    if (largestArraySubscript < [numKey intValue]) {
    largestArraySubscript = [numKey intValue];
    }
    } else if ([key isKindOfClass:[NSString class]]) {
    stringKey = (NSString*)key;
    }
    
    NSObject* value = [self retrieveObjectAt:-1];
    if (value != nil)
    [results setValue:value forKey:stringKey];
    }
    
    lua_pop(L, 1);
    }
    
    if (convertToArray) {
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:largestArraySubscript];
    for (int i = 1; i <= largestArraySubscript; i++) {
    NSString* strI = [[NSNumber numberWithInt:i] stringValue];
    NSObject* objVal = [results objectForKey:strI];
    if (objVal != nil) {
    [array addObject:objVal];
    } else {
    NSLog(@"Warning, conversion of lua array to native array has collapsed a value at index %i", i);
    }
    }
    returnVal = array;
    } else {
    returnVal = results;
    }
    } break;
    
    case LUA_TLIGHTUSERDATA: {
    returnVal = (__bridge NSObject*)lua_touserdata(L, luaIndex);
    } break;
    
    default: {
    NSLog(@"Unknown Lua Type : %i", type);
    }
    }
    
    return returnVal;
    }
    int luaTypeForDefinition(NSString* type) {
    int luatype = 0;
    if ([type isEqualToString:@"Boolean"]) {
    luatype = LUA_TBOOLEAN;
    } else if ([type isEqualToString:@"Integer"] ||
    [type isEqualToString:@"Double"]) {
    luatype = LUA_TNUMBER;
    } else if ([type isEqualToString:@"String"] ||
    [type isEqualToString:@"Date"]) {
    luatype = LUA_TSTRING;
    } else if ([type isEqualToString:@"Map"] ||
    [type isEqualToString:@"Array"]) {
    luatype = LUA_TTABLE;
    }
    return luatype;
    }
    


    */
    
    
    
    
    
    
    
    
    /*
    //Repeated from INWModelController to remove a circular dependency
    +(NSString*) dateAsLocalISOString:(NSDate*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
    }
    
    void writeIntoLua(NSObject* object, NSDictionary* definition, lua_State* L) {
    if ((object == nil) || ([object isKindOfClass:[NSNull class]])) {
    lua_pushnil(L);
    } else if ([object isKindOfClass:[NSString class]]) {
    lua_pushstring(L, [(NSString*)object UTF8String]);
    } else if ([object isKindOfClass:[NSNumber class]]) {
    if (definition != nil) {
    NSString* type = (NSString*)[definition objectForKey:@"type"];
    int luatype = luaTypeForDefinition(type);
    
    if (luatype == LUA_TBOOLEAN) {
    lua_pushboolean(L, [(NSNumber*)object boolValue]);
    } else {
    lua_pushnumber(L, [(NSNumber*)object doubleValue]);
    }
    } else {
    lua_pushnumber(L, [(NSNumber*)object doubleValue]);
    }
    } else if ([object isKindOfClass:[NSDate class]]) {
    lua_pushstring(L, to_cString([LuaManager dateAsLocalISOString:(NSDate*)object]));
    } else if ([object isKindOfClass:[NSDictionary class]]) {
    NSDictionary* map = (NSDictionary*)object;
    lua_newtable(L);
    int top = lua_gettop(L);
    
    for (NSString* key in map) {
    NSDictionary* subDefinition = nil;
    if (definition != nil) {
    subDefinition = (NSDictionary*)[definition objectForKey:key];
    }
    NSObject* value = [map objectForKey:key];
    
    //Only push things into Lua that we know we can marshal, so that we don't get broken key/value pairs
    if ([value isKindOfClass:[NSString class]] ||
    [value isKindOfClass:[NSNumber class]] ||
    [value isKindOfClass:[NSDate class]] ||
    [value isKindOfClass:[NSDictionary class]] ||
    [value isKindOfClass:[NSArray class]]) {
    lua_pushstring(L, to_cString(key));
    writeIntoLua(value, subDefinition, L);
    lua_settable(L, top);
    }
    }
    } else if ([object isKindOfClass:[NSArray class]]) {
    NSArray* array = (NSArray*)object;
    
    lua_newtable(L);
    int top = lua_gettop(L);
    for (int i = 0; i < [array count]; i++) {
    lua_pushnumber(L, i + 1);
    writeIntoLua([array objectAtIndex:i], nil, L);
    lua_settable(L, top);
    }
    }
    }
    
    */
    
    
    
    
    /*
    - (NSObject*)getObjectNamed:(NSString*)name {
    lua_State* L = self.state;
    
    lua_getglobal(L, to_cString(name));
    int top = lua_gettop(L);
    
    NSObject* returnVal = [self retrieveObjectAt:top];
    
    lua_pop(L, 1);
    
    return returnVal;
    }
*/
    
    
    
    
    /*
    NSString* readNSString(lua_State* L, int index) {
    
    const char* string = lua_tostring(L, index);
    if (string != nil) {
    return [NSString stringWithUTF8String:string];
    } else
    return @"";
    }
    */


/*
    NSDictionary* readNSDictionary(lua_State* L, int index) {
    LuaManager* lm = [[LuaManager alloc] init];
    lm.state = L;
    NSDictionary* dictionary = (NSDictionary*)[lm retrieveObjectAt:index];
    return dictionary;
    }
    */
 
    
    
    /*
    NSArray* readNSArray(lua_State* L, int index) {
    LuaManager* lm = [[LuaManager alloc] init];
    lm.state = L;
    NSArray* array = (NSArray*)[lm retrieveObjectAt:index];
    return array;
    }
    
    */
    
    
    
    
    
    
    
    
    
    
    /*


    - (lua_State *) state {
        if (!_state) {
            _state = luaL_newstate();
            luaL_openlibs(_state);
            lua_settop(_state, 0);
        }
    
        return _state;
    }
    
    - (void)runCodeFromString:(NSString *)code {
        // get state
        lua_State *L = self.state;
    
        // compile
        int error = luaL_loadstring(L, to_cString(code));
        if (error) {
            NSString* stackTrace = to_nsString(lua_tostring(L, -1));
            [[INWAppDelegate get] exit:stackTrace];
            return;
        }
    
        // run
        error = lua_pcall(L, 0, 0, 0);
        if (error) {
            NSString* stackTrace = to_nsString(lua_tostring(L, -1));
            [[INWAppDelegate get] exit:stackTrace];
            return;
        }
    }
    
    - (NSObject*) runCodeFromStringWithResult:(NSString *)code {
        // get state
        lua_State *L = self.state;
    
        // compile
        int error = luaL_loadstring(L, to_cString(code));
        if (error) {
        NSString* stackTrace = to_nsString(lua_tostring(L, -1));
        [[INWAppDelegate get] exit:stackTrace];
        return nil;
        }
    
        // run
        error = lua_pcall(L, 0, 1, 0);
        if (error) {
        NSString* stackTrace = to_nsString(lua_tostring(L, -1));
        [[INWAppDelegate get] exit:stackTrace];
        return nil;
        }
    
        return [self retrieveObjectAt:-1];
    }
    
    - (void)runCodeFromFileWithPath:(NSString *)path {
    // get state
    lua_State *L = self.state;
    
    // compile
    int error = luaL_loadfile(L, to_cString(path));
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return;
    }
    
    // run
    error = lua_pcall(L, 0, 0, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return;
    }
    }
    
    - (void)registerFunction:(lua_CFunction)function withName:(NSString *)name {
        lua_register(self.state, to_cString(name), function);
    }
    
    - (void)callFunctionNamed:(NSString *)name {
        // get state
        lua_State *L = self.state;
    
        // prepare for "function(object)"
        lua_getglobal(L, to_cString(name));
    
        // run
        int error = lua_pcall(L, 0, 0, 0);
        if (error) {
        NSString* stackTrace = to_nsString(lua_tostring(L, -1));
        [[INWAppDelegate get] exit:stackTrace];
        return;
    }
    }

    
    - (void)callFunctionNamed:(NSString *)name withObject:(NSObject *)object {
    // get state
    lua_State *L = self.state;
    
    // prepare for "function(object)"
    lua_getglobal(L, to_cString(name));
    
    // load parameter onto stack
    if ([object isKindOfClass:[UIViewController class]]) {
    lua_pushlightuserdata(L, (__bridge void*)(object));
    } else {
    writeIntoLua(object, nil, L);
    }
    
    // run
    int error = lua_pcall(L, 1, 0, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return;
    }
    }
    

    
    
    
    
    
    
    
    
    
    -(void) callFunctionNamed:(NSString*)name withObjects:(NSArray*)objects {
    // get state
    lua_State *L = self.state;
    
    // prepare for "function(object)"
    lua_getglobal(L, to_cString(name));
    
    // load parameter onto stack
    for (NSObject* object in objects) {
    if ([object isKindOfClass:[UIViewController class]]) {
    lua_pushlightuserdata(L, (__bridge void*)(object));
    } else {
    writeIntoLua(object, nil, L);
    }
    }
    
    // run
    int error = lua_pcall(L, [objects count], 0, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return;
    }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    -(NSObject*) callFunctionNamedWithReturnValue:(NSString*)name withObjects:(NSArray*)objects {
    // get state
    lua_State *L = self.state;
    
    // prepare for "function(object)"
    lua_getglobal(L, to_cString(name));
    
    // load parameter onto stack
    for (NSObject* object in objects) {
    if ([object isKindOfClass:[UIViewController class]]) {
    lua_pushlightuserdata(L, (__bridge void*)(object));
    } else {
    writeIntoLua(object, nil, L);
    }
    }
    
    // run
    int error = lua_pcall(L, [objects count], 0, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return nil;
    }
    
    NSObject* result = [self retrieveObjectAt:-1];
    
    return result;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    -(NSObject*)callFunctionNamedWithReturnValue:(NSString*)name andParameter:(NSObject*)parameter {
    // get state
    lua_State *L = self.state;
    
    lua_getglobal(L, to_cString(name));
    
    // load parameter onto stack
    if ([parameter isKindOfClass:[UIViewController class]]) {
    lua_pushlightuserdata(L, (__bridge void*)(parameter));
    } else {
    writeIntoLua(parameter, nil, L);
    }
    
    // run
    int error = lua_pcall(L, 1, 1, 0);
    if (error) {
    NSString* stackTrace = to_nsString(lua_tostring(L, -1));
    [[INWAppDelegate get] exit:stackTrace];
    return nil;
    }
    
    NSObject* result = [self retrieveObjectAt:-1];
    
    return result;
    }
    
    
    
    
    
    
    
    
    
    
    
    - (NSObject*) retrieveObjectAt:(int)luaIndex {
        lua_State* L = self.state;
    
        if (lua_gettop(L) < luaIndex) {
            NSLog(@"WARNING: attempted to get an object at an illegal index");
            return nil;
        }
    
    int type = lua_type(L, luaIndex);
    
    NSObject* returnVal = nil;
    
    switch (type) {
    case LUA_TNIL: {
    returnVal = nil;
    } break;
    
    case LUA_TBOOLEAN: {
    returnVal = [NSNumber numberWithBool:lua_toboolean(L, luaIndex)];
    } break;
    
    case LUA_TSTRING: {
    returnVal = to_nsString(lua_tostring(L, luaIndex));
    } break;
    
    case LUA_TNUMBER: {
    returnVal = [NSNumber numberWithDouble:lua_tonumber(L, luaIndex)];
    } break;
    
    case LUA_TTABLE: {
    NSMutableDictionary* results = [[NSMutableDictionary alloc] init];
    int top = luaIndex;
    if (top < 0) {
    top = lua_gettop(L);
    }
    lua_pushnil(L);
    bool convertToArray = false;
    int largestArraySubscript = 1;
    
    while (lua_next(L, top) != 0) {
    NSObject* key = [self retrieveObjectAt:-2];
    NSString* stringKey = nil;
    
    if (key != nil) {
    if ([key isKindOfClass:[NSNumber class]]) {
    convertToArray = true;
    NSNumber* numKey = (NSNumber*)key;
    stringKey = [(NSNumber*)key stringValue];
    if (largestArraySubscript < [numKey intValue]) {
    largestArraySubscript = [numKey intValue];
    }
    } else if ([key isKindOfClass:[NSString class]]) {
    stringKey = (NSString*)key;
    }
    
    NSObject* value = [self retrieveObjectAt:-1];
    if (value != nil)
    [results setValue:value forKey:stringKey];
    }
    
    lua_pop(L, 1);
    }
    
    if (convertToArray) {
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:largestArraySubscript];
    for (int i = 1; i <= largestArraySubscript; i++) {
    NSString* strI = [[NSNumber numberWithInt:i] stringValue];
    NSObject* objVal = [results objectForKey:strI];
    if (objVal != nil) {
    [array addObject:objVal];
    } else {
    NSLog(@"Warning, conversion of lua array to native array has collapsed a value at index %i", i);
    }
    }
    returnVal = array;
    } else {
    returnVal = results;
    }
    } break;
    
    case LUA_TLIGHTUSERDATA: {
    returnVal = (__bridge NSObject*)lua_touserdata(L, luaIndex);
    } break;
    
    default: {
    NSLog(@"Unknown Lua Type : %i", type);
    }
    }
    
    return returnVal;
    }
    int luaTypeForDefinition(NSString* type) {
    int luatype = 0;
    if ([type isEqualToString:@"Boolean"]) {
    luatype = LUA_TBOOLEAN;
    } else if ([type isEqualToString:@"Integer"] ||
    [type isEqualToString:@"Double"]) {
    luatype = LUA_TNUMBER;
    } else if ([type isEqualToString:@"String"] ||
    [type isEqualToString:@"Date"]) {
    luatype = LUA_TSTRING;
    } else if ([type isEqualToString:@"Map"] ||
    [type isEqualToString:@"Array"]) {
    luatype = LUA_TTABLE;
    }
    return luatype;
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Repeated from INWModelController to remove a circular dependency
    +(NSString*) dateAsLocalISOString:(NSDate*)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormatter stringFromDate:date];
    }
    
    void writeIntoLua(NSObject* object, NSDictionary* definition, lua_State* L) {
    if ((object == nil) || ([object isKindOfClass:[NSNull class]])) {
    lua_pushnil(L);
    } else if ([object isKindOfClass:[NSString class]]) {
    lua_pushstring(L, [(NSString*)object UTF8String]);
    } else if ([object isKindOfClass:[NSNumber class]]) {
    if (definition != nil) {
    NSString* type = (NSString*)[definition objectForKey:@"type"];
    int luatype = luaTypeForDefinition(type);
    
    if (luatype == LUA_TBOOLEAN) {
    lua_pushboolean(L, [(NSNumber*)object boolValue]);
    } else {
    lua_pushnumber(L, [(NSNumber*)object doubleValue]);
    }
    } else {
    lua_pushnumber(L, [(NSNumber*)object doubleValue]);
    }
    } else if ([object isKindOfClass:[NSDate class]]) {
    lua_pushstring(L, to_cString([LuaManager dateAsLocalISOString:(NSDate*)object]));
    } else if ([object isKindOfClass:[NSDictionary class]]) {
    NSDictionary* map = (NSDictionary*)object;
    lua_newtable(L);
    int top = lua_gettop(L);
    
    for (NSString* key in map) {
    NSDictionary* subDefinition = nil;
    if (definition != nil) {
    subDefinition = (NSDictionary*)[definition objectForKey:key];
    }
    NSObject* value = [map objectForKey:key];
    
    //Only push things into Lua that we know we can marshal, so that we don't get broken key/value pairs
    if ([value isKindOfClass:[NSString class]] ||
    [value isKindOfClass:[NSNumber class]] ||
    [value isKindOfClass:[NSDate class]] ||
    [value isKindOfClass:[NSDictionary class]] ||
    [value isKindOfClass:[NSArray class]]) {
    lua_pushstring(L, to_cString(key));
    writeIntoLua(value, subDefinition, L);
    lua_settable(L, top);
    }
    }
    } else if ([object isKindOfClass:[NSArray class]]) {
    NSArray* array = (NSArray*)object;
    
    lua_newtable(L);
    int top = lua_gettop(L);
    for (int i = 0; i < [array count]; i++) {
    lua_pushnumber(L, i + 1);
    writeIntoLua([array objectAtIndex:i], nil, L);
    lua_settable(L, top);
    }
    }
    }
    
    
    
    
    
    
    
    - (NSObject*)getObjectNamed:(NSString*)name {
        lua_State* L = self.state;
    
        lua_getglobal(L, to_cString(name));
        int top = lua_gettop(L);
    
        NSObject* returnVal = [self retrieveObjectAt:top];
    
        lua_pop(L, 1);
    
        return returnVal;
    }
    
    
    
    NSString* readNSString(lua_State* L, int index) {
    
        const char* string = lua_tostring(L, index);
        if (string != nil) {
            return [NSString stringWithUTF8String:string];
        } else 
            return @"";
        }
    
        NSDictionary* readNSDictionary(lua_State* L, int index) {
        LuaManager* lm = [[LuaManager alloc] init];
        lm.state = L;
        NSDictionary* dictionary = (NSDictionary*)[lm retrieveObjectAt:index];
        return dictionary;
    }
    
    
    
    
    NSArray* readNSArray(lua_State* L, int index) {
        LuaManager* lm = [[LuaManager alloc] init];
        lm.state = L;
        NSArray* array = (NSArray*)[lm retrieveObjectAt:index];
        return array;
    }
    
    */
    
    
}


