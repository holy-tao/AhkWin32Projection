#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputRacingWheelButtons extends Win32BitflagEnum {

    /**
     * Native name: GameInputRacingWheelNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: GameInputRacingWheelMenu
     * @type {Integer (Int32)}
     */
    static Menu => 1

    /**
     * Native name: GameInputRacingWheelView
     * @type {Integer (Int32)}
     */
    static View => 2

    /**
     * Native name: GameInputRacingWheelPreviousGear
     * @type {Integer (Int32)}
     */
    static PreviousGear => 4

    /**
     * Native name: GameInputRacingWheelNextGear
     * @type {Integer (Int32)}
     */
    static NextGear => 8

    /**
     * Native name: GameInputRacingWheelDpadUp
     * @type {Integer (Int32)}
     */
    static DpadUp => 16

    /**
     * Native name: GameInputRacingWheelDpadDown
     * @type {Integer (Int32)}
     */
    static DpadDown => 32

    /**
     * Native name: GameInputRacingWheelDpadLeft
     * @type {Integer (Int32)}
     */
    static DpadLeft => 64

    /**
     * Native name: GameInputRacingWheelDpadRight
     * @type {Integer (Int32)}
     */
    static DpadRight => 128
}
