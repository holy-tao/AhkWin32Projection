#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleLayoutGridMode extends Win32Enum {

    /**
     * Native name: styleLayoutGridModeNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleLayoutGridModeChar
     * @type {Integer (Int32)}
     */
    static Char => 1

    /**
     * Native name: styleLayoutGridModeLine
     * @type {Integer (Int32)}
     */
    static Line => 2

    /**
     * Native name: styleLayoutGridModeBoth
     * @type {Integer (Int32)}
     */
    static Both => 3

    /**
     * Native name: styleLayoutGridModeNone
     * @type {Integer (Int32)}
     */
    static None => 4

    /**
     * Native name: styleLayoutGridMode_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
