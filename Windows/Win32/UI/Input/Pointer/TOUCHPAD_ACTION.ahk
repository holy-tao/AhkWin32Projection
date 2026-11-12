#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.Pointer
 */
class TOUCHPAD_ACTION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TA_3FINGER_TAP => 0

    /**
     * @type {Integer (Int32)}
     */
    static TA_3FINGER_PRESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static TA_3FINGER_RELEASE => 2

    /**
     * @type {Integer (Int32)}
     */
    static TA_4FINGER_TAP => 3

    /**
     * @type {Integer (Int32)}
     */
    static TA_4FINGER_PRESS => 4

    /**
     * @type {Integer (Int32)}
     */
    static TA_4FINGER_RELEASE => 5

    /**
     * @type {Integer (Int32)}
     */
    static TA_5FINGER_TAP => 6

    /**
     * @type {Integer (Int32)}
     */
    static TA_5FINGER_PRESS => 7

    /**
     * @type {Integer (Int32)}
     */
    static TA_5FINGER_RELEASE => 8

    /**
     * @type {Integer (Int32)}
     */
    static TA_INERTIA_STOP => 9

    /**
     * @type {Integer (Int32)}
     */
    static TA_INERTIA_END => 10
}
