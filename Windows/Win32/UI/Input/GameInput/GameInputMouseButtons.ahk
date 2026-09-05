#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputMouseButtons extends Win32BitflagEnum {

    /**
     * Native name: GameInputMouseNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: GameInputMouseLeftButton
     * @type {Integer (Int32)}
     */
    static LeftButton => 1

    /**
     * Native name: GameInputMouseRightButton
     * @type {Integer (Int32)}
     */
    static RightButton => 2

    /**
     * Native name: GameInputMouseMiddleButton
     * @type {Integer (Int32)}
     */
    static MiddleButton => 4

    /**
     * Native name: GameInputMouseButton4
     * @type {Integer (Int32)}
     */
    static Button4 => 8

    /**
     * Native name: GameInputMouseButton5
     * @type {Integer (Int32)}
     */
    static Button5 => 16

    /**
     * Native name: GameInputMouseWheelTiltLeft
     * @type {Integer (Int32)}
     */
    static WheelTiltLeft => 32

    /**
     * Native name: GameInputMouseWheelTiltRight
     * @type {Integer (Int32)}
     */
    static WheelTiltRight => 64
}
