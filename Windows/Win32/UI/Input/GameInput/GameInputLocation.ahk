#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputLocation extends Win32Enum {

    /**
     * Native name: GameInputLocationUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => -1

    /**
     * Native name: GameInputLocationChassis
     * @type {Integer (Int32)}
     */
    static Chassis => 0

    /**
     * Native name: GameInputLocationDisplay
     * @type {Integer (Int32)}
     */
    static Display => 1

    /**
     * Native name: GameInputLocationAxis
     * @type {Integer (Int32)}
     */
    static Axis => 2

    /**
     * Native name: GameInputLocationButton
     * @type {Integer (Int32)}
     */
    static Button => 3

    /**
     * Native name: GameInputLocationSwitch
     * @type {Integer (Int32)}
     */
    static Switch => 4

    /**
     * Native name: GameInputLocationKey
     * @type {Integer (Int32)}
     */
    static Key => 5

    /**
     * Native name: GameInputLocationTouchPad
     * @type {Integer (Int32)}
     */
    static TouchPad => 6
}
