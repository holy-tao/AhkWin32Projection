#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkCursor extends Win32Enum {

    /**
     * Native name: DISPID_ICsrName
     * @type {Integer (Int32)}
     */
    static ICsrName => 0

    /**
     * Native name: DISPID_ICsrId
     * @type {Integer (Int32)}
     */
    static ICsrId => 1

    /**
     * Native name: DISPID_ICsrDrawingAttributes
     * @type {Integer (Int32)}
     */
    static ICsrDrawingAttributes => 2

    /**
     * Native name: DISPID_ICsrButtons
     * @type {Integer (Int32)}
     */
    static ICsrButtons => 3

    /**
     * Native name: DISPID_ICsrInverted
     * @type {Integer (Int32)}
     */
    static ICsrInverted => 4

    /**
     * Native name: DISPID_ICsrTablet
     * @type {Integer (Int32)}
     */
    static ICsrTablet => 5
}
