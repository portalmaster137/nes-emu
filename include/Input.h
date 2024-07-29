#pragma once
#include "Base.h"
#include <SDL_scancode.h>
#include <SDL_keycode.h>

namespace Input
{
	// Call once per frame
	void Update();

	bool KeyDown(SDL_Scancode scanCode);
	bool KeyUp(SDL_Scancode scanCode);

	bool KeyPressed(SDL_Scancode scanCode);
	bool KeyReleased(SDL_Scancode scanCode);

	bool AltDown();
	bool CtrlDown();
	bool ShiftDown();

	const char* GetScancodeName(SDL_Scancode scanCode);

	const char* GetKeyName(SDL_Keycode keyCode);
	const char* GetKeyName(SDL_Scancode scanCode);
}
