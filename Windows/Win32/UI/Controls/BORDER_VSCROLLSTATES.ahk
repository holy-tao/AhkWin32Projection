#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class BORDER_VSCROLLSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LBPSV_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static LBPSV_FOCUSED => 2

    /**
     * @type {Integer (Int32)}
     */
    static LBPSV_HOT => 3

    /**
     * @type {Integer (Int32)}
     */
    static LBPSV_DISABLED => 4
}
