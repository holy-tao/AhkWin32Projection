#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputGamepadButtons extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadMenu => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadView => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadA => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadB => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadX => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadY => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadDPadUp => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadDPadDown => 128

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadDPadLeft => 256

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadDPadRight => 512

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadLeftShoulder => 1024

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadRightShoulder => 2048

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadLeftThumbstick => 4096

    /**
     * @type {Integer (Int32)}
     */
    static GameInputGamepadRightThumbstick => 8192
}
