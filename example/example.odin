package main

import ase "../"
import "vendor:raylib"

Player :: struct {
	pos:       [2]f32,
	animation: ase.AsepriteTag,
	aseprite:  ^ase.Aseprite,
	left:      bool,
	action:    Action,
}

Action :: enum {
	IdleLeft,
	IdleRight,
	WalkLeft,
	WalkRight,
}

main :: proc() {
	raylib.SetConfigFlags(raylib.ConfigFlags{.VSYNC_HINT, .MSAA_4X_HINT})
	raylib.InitWindow(800, 600, "example")
	defer raylib.CloseWindow()

	player_aseprite := ase.LoadAseprite("player.aseprite")
	if !ase.IsAsepriteValid(player_aseprite) {
		return
	}
	defer ase.UnloadAseprite(player_aseprite)

	player := Player {
		pos       = {300, 200},
		animation = ase.LoadAsepriteTag(player_aseprite, "idle"),
		aseprite  = &player_aseprite,
		action    = .IdleRight,
	}

	player_speed :: 300

	for !raylib.WindowShouldClose() {
		dt := raylib.GetFrameTime()

		// update animation
		ase.UpdateAsepriteTag(&player.animation)

		// switch animation
		{
			if raylib.IsKeyPressed(.A) {
				player.action = .WalkLeft
				player.animation = ase.LoadAsepriteTag(player.aseprite^, "walk_right")
			}
			if raylib.IsKeyPressed(.D) {
				player.action = .WalkRight
				player.animation = ase.LoadAsepriteTag(player.aseprite^, "walk_right")
			}

			if raylib.IsKeyReleased(.A) {
				player.action = .IdleLeft
				player.animation = ase.LoadAsepriteTag(player.aseprite^, "idle")
			}
			if raylib.IsKeyReleased(.D) {
				player.action = .IdleRight
				player.animation = ase.LoadAsepriteTag(player.aseprite^, "idle")
			}
		}

		if player.action == .WalkLeft {
			player.pos.x -= player_speed * dt
		} else if player.action == .WalkRight {
			player.pos.x += player_speed * dt
		}

		raylib.BeginDrawing()
		raylib.ClearBackground(raylib.WHITE)

		// draw the animation
		facing_left := player.action == .IdleLeft || player.action == .WalkLeft
		ase.DrawAsepriteTagVFlipped(player.animation, player.pos, facing_left, false, raylib.WHITE)

		raylib.EndDrawing()
	}
}
