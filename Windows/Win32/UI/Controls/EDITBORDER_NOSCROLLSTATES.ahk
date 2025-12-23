#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class EDITBORDER_NOSCROLLSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EPSN_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static EPSN_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static EPSN_FOCUSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static EPSN_DISABLED => 4
}
