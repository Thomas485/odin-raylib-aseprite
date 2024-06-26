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
gcc -O3 -c ase.c -o ase.o -I raylib-aseprite/build/_deps/raylib-src/src -I raylib-aseprite/include/
ar rcs ase.a ase.o
