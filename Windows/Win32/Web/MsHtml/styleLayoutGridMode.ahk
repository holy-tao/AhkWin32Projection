#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleLayoutGridMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeChar => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeLine => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeBoth => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridModeNone => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleLayoutGridMode_Max => 2147483647
}
