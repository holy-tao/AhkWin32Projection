#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class SPECIALGROUPCOLLAPSESTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static EBSGC_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static EBSGC_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static EBSGC_PRESSED => 3
}
