#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputKeyboardKind extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUnknownKeyboard => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputAnsiKeyboard => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputIsoKeyboard => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputKsKeyboard => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputAbntKeyboard => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputJisKeyboard => 4
}
