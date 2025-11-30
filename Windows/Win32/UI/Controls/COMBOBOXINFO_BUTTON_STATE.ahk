#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class COMBOBOXINFO_BUTTON_STATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_INVISIBLE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_PRESSED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_FOCUSABLE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_OFFSCREEN => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static STATE_SYSTEM_UNAVAILABLE => 1
}
