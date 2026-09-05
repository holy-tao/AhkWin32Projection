#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleLayoutGridType extends Win32Enum {

    /**
     * Native name: styleLayoutGridTypeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleLayoutGridTypeLoose
     * @type {Integer (Int32)}
     */
    static Loose => 1

    /**
     * Native name: styleLayoutGridTypeStrict
     * @type {Integer (Int32)}
     */
    static Strict => 2

    /**
     * Native name: styleLayoutGridTypeFixed
     * @type {Integer (Int32)}
     */
    static Fixed => 3

    /**
     * Native name: styleLayoutGridType_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
