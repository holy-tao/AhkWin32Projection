#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputFlightStickButtons extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFlightStickNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFlightStickMenu => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFlightStickView => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFlightStickFirePrimary => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputFlightStickFireSecondary => 8
}
