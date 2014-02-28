AC_CANONICAL_SYSTEM

enable_crosscompile=no
if test "x$host" != "x$target"; then
    enable_crosscompile=yes
    case "$target" in
        *-mingw*|*-*-cygwin*)
            TARGET_OS=windows
            ;;
        arm*-darwin*)
            TARGET_OS=unix
            ;;
        powerpc64-*-linux-gnu)
            TARGET_OS=unix
            ;;
        arm*-linux-*)
            TARGET_OS=unix
            ;;
        *)
            AC_MSG_ERROR([Cross compiling is not supported for target $target])
            ;;
    esac
fi

if test "$TARGET_OS" = "windows"; then
    AC_DEFINE([BSON_OS], 2, [libbson compiling for windows])
else
    AC_DEFINE([BSON_OS], 1, [libbson compiling for unix])
fi

AC_SUBST([BSON_OS])
