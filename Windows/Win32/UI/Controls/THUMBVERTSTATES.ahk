#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class THUMBVERTSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_FOCUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static TUVS_DISABLED => 5
}
