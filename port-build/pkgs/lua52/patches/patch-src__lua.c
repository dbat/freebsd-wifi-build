--- src/lua.c.orig	2017-03-09 11:18:28.438677000 +0000
+++ src/lua.c	2017-03-09 11:18:54.900602000 +0000
@@ -64,8 +64,8 @@
 #if defined(LUA_USE_READLINE)
 
 #include <stdio.h>
-#include <readline/readline.h>
-#include <readline/history.h>
+#include <edit/readline/readline.h>
+#include <edit/readline/history.h>
 #define lua_readline(L,b,p)	((void)L, ((b)=readline(p)) != NULL)
 #define lua_saveline(L,idx) \
         if (lua_rawlen(L,idx) > 0)  /* non-empty line? */ \
