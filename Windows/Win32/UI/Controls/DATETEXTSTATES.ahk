#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DATETEXTSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DPDT_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DPDT_DISABLED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DPDT_SELECTED => 3
}
