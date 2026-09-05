#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputGamepadButtons extends Win32BitflagEnum {

    /**
     * Native name: GameInputGamepadNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: GameInputGamepadMenu
     * @type {Integer (Int32)}
     */
    static Menu => 1

    /**
     * Native name: GameInputGamepadView
     * @type {Integer (Int32)}
     */
    static View => 2

    /**
     * Native name: GameInputGamepadA
     * @type {Integer (Int32)}
     */
    static GamepadA => 4

    /**
     * Native name: GameInputGamepadB
     * @type {Integer (Int32)}
     */
    static GamepadB => 8

    /**
     * Native name: GameInputGamepadX
     * @type {Integer (Int32)}
     */
    static GamepadX => 16

    /**
     * Native name: GameInputGamepadY
     * @type {Integer (Int32)}
     */
    static GamepadY => 32

    /**
     * Native name: GameInputGamepadDPadUp
     * @type {Integer (Int32)}
     */
    static GamepadDPadUp => 64

    /**
     * Native name: GameInputGamepadDPadDown
     * @type {Integer (Int32)}
     */
    static GamepadDPadDown => 128

    /**
     * Native name: GameInputGamepadDPadLeft
     * @type {Integer (Int32)}
     */
    static GamepadDPadLeft => 256

    /**
     * Native name: GameInputGamepadDPadRight
     * @type {Integer (Int32)}
     */
    static GamepadDPadRight => 512

    /**
     * Native name: GameInputGamepadLeftShoulder
     * @type {Integer (Int32)}
     */
    static LeftShoulder => 1024

    /**
     * Native name: GameInputGamepadRightShoulder
     * @type {Integer (Int32)}
     */
    static RightShoulder => 2048

    /**
     * Native name: GameInputGamepadLeftThumbstick
     * @type {Integer (Int32)}
     */
    static LeftThumbstick => 4096

    /**
     * Native name: GameInputGamepadRightThumbstick
     * @type {Integer (Int32)}
     */
    static RightThumbstick => 8192
}
