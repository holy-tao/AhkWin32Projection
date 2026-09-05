#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleHyphens extends Win32Enum {

    /**
     * Native name: styleHyphensNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: styleHyphensManual
     * @type {Integer (Int32)}
     */
    static Manual => 1

    /**
     * Native name: styleHyphensAuto
     * @type {Integer (Int32)}
     */
    static Auto => 2

    /**
     * Native name: styleHyphensNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 3

    /**
     * Native name: styleHyphens_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
