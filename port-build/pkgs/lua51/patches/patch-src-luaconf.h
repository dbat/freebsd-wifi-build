--- src/luaconf.h.orig	2017-03-06 02:00:21.302523000 +0700
+++ src/luaconf.h	2017-03-06 02:01:27.138974000 +0700
@@ -273,6 +273,6 @@
 #if defined(LUA_USE_READLINE)
 #include <stdio.h>
-#include <readline/readline.h>
-#include <readline/history.h>
+#include <edit/readline/readline.h>
+#include <edit/readline/history.h>
 #define lua_readline(L,b,p)	((void)L, ((b)=readline(p)) != NULL)
 #define lua_saveline(L,idx) \
