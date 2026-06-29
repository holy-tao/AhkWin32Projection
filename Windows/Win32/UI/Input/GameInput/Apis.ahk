#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IGameInput.ahk" { IGameInput }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */

;@region Functions
/**
 * 
 * @returns {IGameInput} 
 */
export GameInputCreate() {
    result := DllCall("GameInput.dll\GameInputCreate", "ptr*", &gameInput := 0, "HRESULT")
    return IGameInput(gameInput)
}

;@endregion Functions
