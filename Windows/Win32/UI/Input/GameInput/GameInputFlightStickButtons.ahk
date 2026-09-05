#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputFlightStickButtons extends Win32BitflagEnum {

    /**
     * Native name: GameInputFlightStickNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: GameInputFlightStickMenu
     * @type {Integer (Int32)}
     */
    static Menu => 1

    /**
     * Native name: GameInputFlightStickView
     * @type {Integer (Int32)}
     */
    static View => 2

    /**
     * Native name: GameInputFlightStickFirePrimary
     * @type {Integer (Int32)}
     */
    static FirePrimary => 4

    /**
     * Native name: GameInputFlightStickFireSecondary
     * @type {Integer (Int32)}
     */
    static FireSecondary => 8
}
