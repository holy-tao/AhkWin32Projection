#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputRumbleMotors extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRumbleNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRumbleLowFrequency => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRumbleHighFrequency => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRumbleLeftTrigger => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRumbleRightTrigger => 8
}
