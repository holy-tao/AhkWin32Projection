#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputRumbleMotors extends Win32BitflagEnum {

    /**
     * Native name: GameInputRumbleNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: GameInputRumbleLowFrequency
     * @type {Integer (Int32)}
     */
    static LowFrequency => 1

    /**
     * Native name: GameInputRumbleHighFrequency
     * @type {Integer (Int32)}
     */
    static HighFrequency => 2

    /**
     * Native name: GameInputRumbleLeftTrigger
     * @type {Integer (Int32)}
     */
    static LeftTrigger => 4

    /**
     * Native name: GameInputRumbleRightTrigger
     * @type {Integer (Int32)}
     */
    static RightTrigger => 8
}
