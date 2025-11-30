#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SORTDIRECTION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SORT_DESCENDING => -1

    /**
     * @type {Integer (Int32)}
     */
    static SORT_ASCENDING => 1
}
