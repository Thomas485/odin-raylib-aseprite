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

gcc -O2 -c ase.c -o ase.o -I raylib/src -I raylib-aseprite/include/
ar rcs ase.a ase.o
