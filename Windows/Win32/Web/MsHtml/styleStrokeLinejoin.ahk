#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleStrokeLinejoin extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoinNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoinMiter => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoinRound => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoinBevel => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleStrokeLinejoin_Max => 2147483647
}
