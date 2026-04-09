#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class CONTENTLINKSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CPCL_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CPCL_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CPCL_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static CPCL_DISABLED => 4
}
