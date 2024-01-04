AC_INIT([nesemu], [1.0], [portalmaster137@gmail.com])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_PROG_CXX
AC_CONFIG_FILES([
    Makefile
    src/Makefile
    inc/Makefile
])
PKG_CHECK_MODULES(SDL, [sdl2])
AM_PATH_SDL2([2.0.0])
CFLAGS="$CFLAGS $SDL_CFLAGS"
LIBS="$LIBS $SDL_LIBS"
AC_OUTPUT