#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class HEADER_CONTROL_NOTIFICATION_BUTTON extends Win32Enum {

    /**
     * Native name: HEADER_CONTROL_NOTIFICATION_BUTTON_LEFT
     * @type {Integer (Int32)}
     */
    static LEFT => 0

    /**
     * Native name: HEADER_CONTROL_NOTIFICATION_BUTTON_RIGHT
     * @type {Integer (Int32)}
     */
    static RIGHT => 1

    /**
     * Native name: HEADER_CONTROL_NOTIFICATION_BUTTON_MIDDLE
     * @type {Integer (Int32)}
     */
    static MIDDLE => 2
}
