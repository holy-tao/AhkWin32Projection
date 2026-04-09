#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class MOREPROGRAMSARROWBACKSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPSB_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPSB_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPSB_PRESSED => 3
}
