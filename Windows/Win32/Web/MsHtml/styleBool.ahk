#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBool extends Win32Enum {

    /**
     * Native name: styleBoolFalse
     * @type {Integer (Int32)}
     */
    static False => 0

    /**
     * Native name: styleBoolTrue
     * @type {Integer (Int32)}
     */
    static True => 1

    /**
     * Native name: styleBool_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
