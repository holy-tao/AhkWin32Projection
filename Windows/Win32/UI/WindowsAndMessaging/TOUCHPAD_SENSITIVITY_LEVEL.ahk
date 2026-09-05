#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
class TOUCHPAD_SENSITIVITY_LEVEL extends Win32Enum {

    /**
     * Native name: TOUCHPAD_SENSITIVITY_LEVEL_MOST_SENSITIVE
     * @type {Integer (Int32)}
     */
    static MOST_SENSITIVE => 0

    /**
     * Native name: TOUCHPAD_SENSITIVITY_LEVEL_HIGH_SENSITIVITY
     * @type {Integer (Int32)}
     */
    static HIGH_SENSITIVITY => 1

    /**
     * Native name: TOUCHPAD_SENSITIVITY_LEVEL_MEDIUM_SENSITIVITY
     * @type {Integer (Int32)}
     */
    static MEDIUM_SENSITIVITY => 2

    /**
     * Native name: TOUCHPAD_SENSITIVITY_LEVEL_LOW_SENSITIVITY
     * @type {Integer (Int32)}
     */
    static LOW_SENSITIVITY => 3

    /**
     * Native name: TOUCHPAD_SENSITIVITY_LEVEL_LEAST_SENSITIVE
     * @type {Integer (Int32)}
     */
    static LEAST_SENSITIVE => 4
}
