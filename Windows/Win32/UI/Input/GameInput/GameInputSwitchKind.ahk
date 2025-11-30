#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputSwitchKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUnknownSwitchKind => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInput2WaySwitch => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInput4WaySwitch => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInput8WaySwitch => 2
}
