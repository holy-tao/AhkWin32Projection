#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleStrokeLinejoin extends Win32Enum {

    /**
     * Native name: styleStrokeLinejoinNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleStrokeLinejoinMiter
     * @type {Integer (Int32)}
     */
    static Miter => 1

    /**
     * Native name: styleStrokeLinejoinRound
     * @type {Integer (Int32)}
     */
    static Round => 2

    /**
     * Native name: styleStrokeLinejoinBevel
     * @type {Integer (Int32)}
     */
    static Bevel => 3

    /**
     * Native name: styleStrokeLinejoin_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
