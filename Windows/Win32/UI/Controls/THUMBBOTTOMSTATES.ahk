#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class THUMBBOTTOMSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TUBS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TUBS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TUBS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TUBS_FOCUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TUBS_DISABLED => 5
}
