#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LISTBOXPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static LBCP_BORDER_HSCROLL => 1

    /**
     * @type {Integer (Int32)}
     */
    static LBCP_BORDER_HVSCROLL => 2

    /**
     * @type {Integer (Int32)}
     */
    static LBCP_BORDER_NOSCROLL => 3

    /**
     * @type {Integer (Int32)}
     */
    static LBCP_BORDER_VSCROLL => 4

    /**
     * @type {Integer (Int32)}
     */
    static LBCP_ITEM => 5
}
