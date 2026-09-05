#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleLayoutGridChar extends Win32Enum {

    /**
     * Native name: styleLayoutGridCharNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleLayoutGridCharAuto
     * @type {Integer (Int32)}
     */
    static Auto => 1

    /**
     * Native name: styleLayoutGridCharNone
     * @type {Integer (Int32)}
     */
    static None => 2

    /**
     * Native name: styleLayoutGridChar_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
