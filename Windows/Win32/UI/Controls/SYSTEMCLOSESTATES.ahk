#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class SYSTEMCLOSESTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static MSYSC_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSYSC_DISABLED => 2
}
