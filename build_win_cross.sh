# download raylib-aseprite
if [ -d "raylib-aseprite/" ]; then
    cd raylib-aseprite
    git pull
else
    git clone https://github.com/RobLoach/raylib-aseprite.git
    cd raylib-aseprite
fi

# create cmake build directory
if [ ! -d "build/" ]; then
    mkdir build
fi

# download raylib
cd build
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .. 

# build
cd ../..
x86_64-w64-mingw32-gcc-win32 -c -o3 ase.c -o ase_win.o -I include/ -I raylib-aseprite/build/_deps/raylib-src/src
x86_64-w64-mingw32-ar rcs ase.lib ase_win.o
