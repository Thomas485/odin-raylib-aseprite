echo "fetching data"

# download raylib
if [ ! -d "raylib/" ]; then
    git clone --depth 1 --branch 5.5 https://github.com/raysan5/raylib.git
fi

# download raylib-aseprite
if [ -d "raylib-aseprite/" ]; then
    git pull
else
    git clone https://github.com/RobLoach/raylib-aseprite.git
fi


echo "build"

x86_64-w64-mingw32-gcc-win32 -c -O2 ase.c -o ase_win.o -I raylib/src -I raylib-aseprite/include/
x86_64-w64-mingw32-ar rcs ase.lib ase_win.o
