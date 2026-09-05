#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleStyleFloat extends Win32Enum {

    /**
     * Native name: styleStyleFloatNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleStyleFloatLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: styleStyleFloatRight
     * @type {Integer (Int32)}
     */
    static Right => 2

    /**
     * Native name: styleStyleFloatNone
     * @type {Integer (Int32)}
     */
    static None => 3

    /**
     * Native name: styleStyleFloat_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
