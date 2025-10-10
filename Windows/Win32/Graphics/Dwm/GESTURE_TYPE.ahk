#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the gesture type specified in DwmRenderGesture.
 * @see https://docs.microsoft.com/windows/win32/api//dwmapi/ne-dwmapi-gesture_type
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class GESTURE_TYPE{

    /**
     * A pen tap.
     * @type {Integer (Int32)}
     */
    static GT_PEN_TAP => 0

    /**
     * A pen double tap.
     * @type {Integer (Int32)}
     */
    static GT_PEN_DOUBLETAP => 1

    /**
     * A pen right tap.
     * @type {Integer (Int32)}
     */
    static GT_PEN_RIGHTTAP => 2

    /**
     * A pen press and hold.
     * @type {Integer (Int32)}
     */
    static GT_PEN_PRESSANDHOLD => 3

    /**
     * An abort of the pen press and hold.
     * @type {Integer (Int32)}
     */
    static GT_PEN_PRESSANDHOLDABORT => 4

    /**
     * A touch tap.
     * @type {Integer (Int32)}
     */
    static GT_TOUCH_TAP => 5

    /**
     * A touch double tap.
     * @type {Integer (Int32)}
     */
    static GT_TOUCH_DOUBLETAP => 6

    /**
     * A touch right tap.
     * @type {Integer (Int32)}
     */
    static GT_TOUCH_RIGHTTAP => 7

    /**
     * A touch press and hold.
     * @type {Integer (Int32)}
     */
    static GT_TOUCH_PRESSANDHOLD => 8

    /**
     * An abort of the pen press and hold.
     * @type {Integer (Int32)}
     */
    static GT_TOUCH_PRESSANDHOLDABORT => 9

    /**
     * A touch press and tap.
     * @type {Integer (Int32)}
     */
    static GT_TOUCH_PRESSANDTAP => 10
}
