package main

import "core:c"
import "vendor:raylib"

when ODIN_OS == .Windows do foreign import ase "ase.lib"
when ODIN_OS == .Linux do foreign import ase "ase.a"

ase_t :: struct {}
ase_tag_t :: struct {}

Aseprite :: struct {
	ase: ^ase_t,
}

AsepriteTag :: struct {
	name:         cstring,
	currentFrame: c.int,
	timer:        c.float,
	direction:    c.int,
	speed:        c.float,
	color:        raylib.Color,
	loop:         c.bool,
	paused:       c.bool,
	aseprite:     Aseprite,
	tag:          ^ase_tag_t,
}

AsepriteSlice :: struct {
	name:   cstring,
	bounds: raylib.Rectangle,
}

foreign ase {
	// Aseprite functions

	// Aseprite LoadAseprite(const char* fileName);
	LoadAseprite :: proc(fileName: cstring) -> Aseprite ---
	// Aseprite LoadAsepriteFromMemory(unsigned char* fileData, int size);
	LoadAsepriteFromMemory :: proc(fileData: ^c.uchar, size: c.int) -> Aseprite ---
	// bool IsAsepriteReady(Aseprite aseprite);
	IsAsepriteReady :: proc(aseprite: Aseprite) -> c.bool ---
	// void UnloadAseprite(Aseprite aseprite);
	UnloadAseprite :: proc(aseprite: Aseprite) ---
	// void TraceAseprite(Aseprite aseprite);
	TraceAseprite :: proc(aseprite: Aseprite) ---
	// Texture GetAsepriteTexture(Aseprite aseprite);
	GetAsepriteTexture :: proc(aseprite: Aseprite) -> raylib.Texture ---
	// int GetAsepriteWidth(Aseprite aseprite);
	GetAsepriteWidth :: proc(aseprite: Aseprite) -> c.int ---
	// int GetAsepriteHeight(Aseprite aseprite);
	GetAsepriteHeight :: proc(aseprite: Aseprite) -> c.int ---
	// void DrawAseprite(Aseprite aseprite, int frame, int posX, int posY, Color tint);
	DrawAseprite :: proc(aseprite: Aseprite, frame: c.int, posX: c.int, posY: c.int, tint: raylib.Color) ---
	// void DrawAsepriteV(Aseprite aseprite, int frame, Vector2 position, Color tint);
	DrawAsepriteV :: proc(aseprite: Aseprite, frame: c.int, position: raylib.Vector2, tint: raylib.Color) ---
	// void DrawAsepriteEx(Aseprite aseprite, int frame, Vector2 position, float rotation, float scale, Color tint);
	DrawAsepriteEx :: proc(aseprite: Aseprite, frame: c.int, position: raylib.Vector2, rotation: c.float, scale: c.float, tint: raylib.Color) ---
	// void DrawAsepritePro(Aseprite aseprite, int frame, Rectangle dest, Vector2 origin, float rotation, Color tint);
	DrawAsepritePro :: proc(aseprite: Aseprite, frame: c.int, dest: raylib.Rectangle, origin: raylib.Vector2, rotation: c.float, tint: raylib.Color) ---
	// void DrawAsepriteFlipped(Aseprite aseprite, int frame, int posX, int posY, bool horizontalFlip, bool verticalFlip, Color tint);
	DrawAsepriteFlipped :: proc(aseprite: Aseprite, frame: c.int, posX: c.int, posY: c.int, horizontalFlip: c.bool, verticalFlip: c.bool, tint: raylib.Color) ---
	// void DrawAsepriteVFlipped(Aseprite aseprite, int frame, Vector2 position, bool horizontalFlip, bool verticalFlip, Color tint);
	DrawAsepriteVFlipped :: proc(aseprite: Aseprite, frame: c.int, position: raylib.Vector2, horizontalFlip: c.bool, verticalFlip: c.bool, tint: raylib.Color) ---
	// void DrawAsepriteExFlipped(Aseprite aseprite, int frame, Vector2 position, float rotation, float scale, bool horizontalFlip, bool verticalFlip, Color tint);
	DrawAsepriteExFlipped :: proc(aseprite: Aseprite, frame: c.int, position: raylib.Vector2, rotation: c.float, scale: c.float, horizontalFlip: c.bool, verticalFlip: c.bool, tint: raylib.Color) ---
	// void DrawAsepriteProFlipped(Aseprite aseprite, int frame, Rectangle dest, Vector2 origin, float rotation, bool horizontalFlip, bool verticalFlip, Color tint);
	DrawAsepriteProFlipped :: proc(aseprite: Aseprite, frame: c.int, dest: raylib.Rectangle, origin: raylib.Vector2, rotation: c.float, horizontalFlip: c.bool, verticalFlip: c.bool, tint: raylib.Color) ---


	// Aseprite Tag functions

	// AsepriteTag LoadAsepriteTag(Aseprite aseprite, const char* name);
	LoadAsepriteTag :: proc(aseprite: Aseprite, name: cstring) -> AsepriteTag ---
	// AsepriteTag LoadAsepriteTagFromIndex(Aseprite aseprite, int index);
	LoadAsepriteTagFromIndex :: proc(aseprite: Aseprite, index: c.int) -> AsepriteTag ---
	// int GetAsepriteTagCount(Aseprite aseprite);
	GetAsepriteTagCount :: proc(aseprite: Aseprite) -> c.int ---
	// bool IsAsepriteTagReady(AsepriteTag tag);
	IsAsepriteTagReady :: proc(tag: AsepriteTag) -> c.bool ---
	// void UpdateAsepriteTag(AsepriteTag* tag);
	UpdateAsepriteTag :: proc(tag: ^AsepriteTag) ---
	// AsepriteTag GenAsepriteSliceDefault();
	GenAsepriteTagDefault :: proc() -> AsepriteTag ---
	// void DrawAsepriteTag(AsepriteTag tag, int posX, int posY, Color tint);
	DrawAsepriteTag :: proc(tag: AsepriteTag, posX: c.int, posY: c.int, tint: raylib.Color) ---
	// void DrawAsepriteTagV(AsepriteTag tag, Vector2 position, Color tint);
	DrawAsepriteTagV :: proc(tag: AsepriteTag, position: raylib.Vector2, tint: raylib.Color) ---
	// void DrawAsepriteTagEx(AsepriteTag tag, Vector2 position, float rotation, float scale, Color tint);
	DrawAsepriteTagEx :: proc(tag: AsepriteTag, position: raylib.Vector2, rotation: c.float, scale: c.float, tint: raylib.Color) ---
	// void DrawAsepriteTagPro(AsepriteTag tag, Rectangle dest, Vector2 origin, float rotation, Color tint);
	DrawAsepriteTagPro :: proc(tag: AsepriteTag, dest: raylib.Rectangle, origin: raylib.Vector2, rotation: c.float, tint: raylib.Color) ---
	// void DrawAsepriteTagFlipped(AsepriteTag tag, int posX, int posY, bool horizontalFlip, bool verticalFlip, Color tint);
	DrawAsepriteTagFlipped :: proc(tag: AsepriteTag, posX: c.int, posY: c.int, horizontalFlip: c.bool, verticalFlip: c.bool, tint: raylib.Color) ---
	// void DrawAsepriteTagVFlipped(AsepriteTag tag, Vector2 position, bool horizontalFlip, bool verticalFlip, Color tint);
	DrawAsepriteTagVFlipped :: proc(tag: AsepriteTag, position: raylib.Vector2, horizontalFlip: c.bool, verticalFlip: c.bool, tint: raylib.Color) ---
	// void DrawAsepriteTagExFlipped(AsepriteTag tag, Vector2 position, float rotation, float scale, bool horizontalFlip, bool verticalFlip, Color tint);
	DrawAsepriteTagExFlipped :: proc(tag: AsepriteTag, position: raylib.Vector2, rotation: c.float, scale: c.float, horizontalFlip: c.bool, verticalFlip: c.bool, tint: raylib.Color) ---
	// void DrawAsepriteTagProFlipped(AsepriteTag tag, Rectangle dest, Vector2 origin, float rotation, bool horizontalFlip, bool verticalFlip, Color tint);
	DrawAsepriteTagProFlipped :: proc(tag: AsepriteTag, dest: raylib.Rectangle, origin: raylib.Vector2, rotation: c.float, horizontalFlip: c.bool, verticalFlip: c.bool, tint: raylib.Color) ---


	// Aseprite Slice functions

	// AsepriteSlice LoadAsepriteSlice(Aseprite aseprite, const char* name);
	LoadAsepriteSlice :: proc(aseprite: Aseprite, name: cstring) -> AsepriteSlice ---
	// AsepriteSlice LoadAsperiteSliceFromIndex(Aseprite aseprite, int index);
	LoadAsepriteSliceFromIndex :: proc(aseprite: Aseprite, index: c.int) -> AsepriteSlice ---
	// int GetAsepriteSliceCount(Aseprite aseprite);
	GetAsepriteSliceCount :: proc(slice: AsepriteSlice) -> c.int ---
	// bool IsAsepriteSliceReady(AsepriteSlice slice);
	IsAsepriteSliceReady :: proc(slice: AsepriteSlice) -> c.bool ---
	// AsepriteSlice GenAsepriteSliceDefault();
	GenAsepriteSliceDefault :: proc() -> AsepriteSlice ---
}
