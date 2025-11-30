#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TASKLINKSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CPTL_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static CPTL_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static CPTL_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static CPTL_DISABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static CPTL_PAGE => 5
}
