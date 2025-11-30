#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class DISPID_InkCursor extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrName => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrDrawingAttributes => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrButtons => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrInverted => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_ICsrTablet => 5
}
