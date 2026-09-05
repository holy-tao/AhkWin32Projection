#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputSwitchKind extends Win32Enum {

    /**
     * Native name: GameInputUnknownSwitchKind
     * @type {Integer (Int32)}
     */
    static UnknownSwitchKind => -1

    /**
     * Native name: GameInput2WaySwitch
     * @type {Integer (Int32)}
     */
    static Input2WaySwitch => 0

    /**
     * Native name: GameInput4WaySwitch
     * @type {Integer (Int32)}
     */
    static Input4WaySwitch => 1

    /**
     * Native name: GameInput8WaySwitch
     * @type {Integer (Int32)}
     */
    static Input8WaySwitch => 2
}
