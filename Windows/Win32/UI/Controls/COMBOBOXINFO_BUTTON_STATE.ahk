#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class COMBOBOXINFO_BUTTON_STATE extends Win32Enum {

    /**
     * Native name: STATE_SYSTEM_INVISIBLE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INVISIBLE => 32768

    /**
     * Native name: STATE_SYSTEM_PRESSED
     * @type {Integer (UInt32)}
     */
    static SYSTEM_PRESSED => 8

    /**
     * Native name: STATE_SYSTEM_FOCUSABLE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_FOCUSABLE => 1048576

    /**
     * Native name: STATE_SYSTEM_OFFSCREEN
     * @type {Integer (UInt32)}
     */
    static SYSTEM_OFFSCREEN => 65536

    /**
     * Native name: STATE_SYSTEM_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_UNAVAILABLE => 1
}
