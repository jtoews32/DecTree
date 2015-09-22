//
//  LuaState.swift
//  DecTree
//
//  Created by Jon Toews on 7/25/15.
//  Copyright (c) 2015 Jon Toews. All rights reserved.
//

import Foundation

// maybe make this an enum with associated data...
typealias EvalResult = (code: Int32, results: [String])


class LuaState
{
    let L: COpaquePointer
    
    init()
    {
        L = luaL_newstate()
        luaL_openlibs(L)
    }
    
    
    deinit
    {
        lua_close(L)
    }
    
    

}