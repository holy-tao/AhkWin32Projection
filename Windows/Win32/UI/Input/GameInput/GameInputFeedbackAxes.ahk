#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputFeedbackAxes extends Win32BitflagEnum {

    /**
     * Native name: GameInputFeedbackAxisNone
     * @type {Integer (Int32)}
     */
    static AxisNone => 0

    /**
     * Native name: GameInputFeedbackAxisLinearX
     * @type {Integer (Int32)}
     */
    static AxisLinearX => 1

    /**
     * Native name: GameInputFeedbackAxisLinearY
     * @type {Integer (Int32)}
     */
    static AxisLinearY => 2

    /**
     * Native name: GameInputFeedbackAxisLinearZ
     * @type {Integer (Int32)}
     */
    static AxisLinearZ => 4

    /**
     * Native name: GameInputFeedbackAxisAngularX
     * @type {Integer (Int32)}
     */
    static AxisAngularX => 8

    /**
     * Native name: GameInputFeedbackAxisAngularY
     * @type {Integer (Int32)}
     */
    static AxisAngularY => 16

    /**
     * Native name: GameInputFeedbackAxisAngularZ
     * @type {Integer (Int32)}
     */
    static AxisAngularZ => 32

    /**
     * Native name: GameInputFeedbackAxisNormal
     * @type {Integer (Int32)}
     */
    static AxisNormal => 64
}
