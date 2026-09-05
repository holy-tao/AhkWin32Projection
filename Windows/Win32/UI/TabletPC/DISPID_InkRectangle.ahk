#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
class DISPID_InkRectangle extends Win32Enum {

    /**
     * Native name: DISPID_IRTop
     * @type {Integer (Int32)}
     */
    static IRTop => 1

    /**
     * Native name: DISPID_IRLeft
     * @type {Integer (Int32)}
     */
    static IRLeft => 2

    /**
     * Native name: DISPID_IRBottom
     * @type {Integer (Int32)}
     */
    static IRBottom => 3

    /**
     * Native name: DISPID_IRRight
     * @type {Integer (Int32)}
     */
    static IRRight => 4

    /**
     * Native name: DISPID_IRGetRectangle
     * @type {Integer (Int32)}
     */
    static IRGetRectangle => 5

    /**
     * Native name: DISPID_IRSetRectangle
     * @type {Integer (Int32)}
     */
    static IRSetRectangle => 6

    /**
     * Native name: DISPID_IRData
     * @type {Integer (Int32)}
     */
    static IRData => 7
}
