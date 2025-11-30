#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputSystemButtons extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSystemButtonNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSystemButtonGuide => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputSystemButtonShare => 2
}
