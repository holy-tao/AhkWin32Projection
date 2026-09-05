#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputSwitchPosition extends Win32Enum {

    /**
     * Native name: GameInputSwitchCenter
     * @type {Integer (Int32)}
     */
    static Center => 0

    /**
     * Native name: GameInputSwitchUp
     * @type {Integer (Int32)}
     */
    static Up => 1

    /**
     * Native name: GameInputSwitchUpRight
     * @type {Integer (Int32)}
     */
    static UpRight => 2

    /**
     * Native name: GameInputSwitchRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: GameInputSwitchDownRight
     * @type {Integer (Int32)}
     */
    static DownRight => 4

    /**
     * Native name: GameInputSwitchDown
     * @type {Integer (Int32)}
     */
    static Down => 5

    /**
     * Native name: GameInputSwitchDownLeft
     * @type {Integer (Int32)}
     */
    static DownLeft => 6

    /**
     * Native name: GameInputSwitchLeft
     * @type {Integer (Int32)}
     */
    static Left => 7

    /**
     * Native name: GameInputSwitchUpLeft
     * @type {Integer (Int32)}
     */
    static UpLeft => 8
}
