#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class THUMBSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TUS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TUS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TUS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TUS_FOCUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TUS_DISABLED => 5
}
