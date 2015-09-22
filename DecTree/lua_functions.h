//
//  lua_functions.h
//  DecTree
//
//  Created by Jon Toews on 9/21/15.
//  Copyright © 2015 Jon Toews. All rights reserved.
//
/*
#ifndef lua_functions_h
#define lua_functions_h



#endif */

/* lua_functions_h */


#include <stdio.h>

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

int model_get(lua_State *L);
int model_put(lua_State *L);