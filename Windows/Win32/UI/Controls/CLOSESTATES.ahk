#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class CLOSESTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TTCS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static TTCS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static TTCS_PRESSED => 3
}
