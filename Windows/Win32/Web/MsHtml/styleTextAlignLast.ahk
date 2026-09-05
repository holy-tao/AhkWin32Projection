#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextAlignLast extends Win32Enum {

    /**
     * Native name: styleTextAlignLastNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleTextAlignLastLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: styleTextAlignLastCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: styleTextAlignLastRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: styleTextAlignLastJustify
     * @type {Integer (Int32)}
     */
    static Justify => 4

    /**
     * Native name: styleTextAlignLastAuto
     * @type {Integer (Int32)}
     */
    static Auto => 5

    /**
     * Native name: styleTextAlignLast_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
