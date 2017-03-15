--- src/lmathlib.c.orig	2017-03-09 11:41:36.975583000 +0000
+++ src/lmathlib.c	2017-03-09 11:44:15.433015000 +0000
@@ -198,7 +198,7 @@
 static int math_random (lua_State *L) {
   /* the `%' avoids the (rare) case of r==1, and is needed also because on
      some systems (SunOS!) `rand()' may return a value larger than RAND_MAX */
-  lua_Number r = (lua_Number)(rand()%RAND_MAX) / (lua_Number)RAND_MAX;
+  lua_Number r = (lua_Number)(random()%RAND_MAX) / (lua_Number)RAND_MAX;
   switch (lua_gettop(L)) {  /* check number of arguments */
     case 0: {  /* no arguments */
       lua_pushnumber(L, r);  /* Number between 0 and 1 */
@@ -224,8 +224,8 @@
 
 
 static int math_randomseed (lua_State *L) {
-  srand(luaL_checkunsigned(L, 1));
-  (void)rand(); /* discard first value to avoid undesirable correlations */
+  srandom(luaL_checkunsigned(L, 1));
+  (void)random(); /* discard first value to avoid undesirable correlations */
   return 0;
 }
 
