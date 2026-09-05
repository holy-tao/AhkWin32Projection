#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputSystemButtons extends Win32BitflagEnum {

    /**
     * Native name: GameInputSystemButtonNone
     * @type {Integer (Int32)}
     */
    static ButtonNone => 0

    /**
     * Native name: GameInputSystemButtonGuide
     * @type {Integer (Int32)}
     */
    static ButtonGuide => 1

    /**
     * Native name: GameInputSystemButtonShare
     * @type {Integer (Int32)}
     */
    static ButtonShare => 2
}
