#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class stylePosition extends Win32Enum {

    /**
     * Native name: stylePositionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: stylePositionstatic
     * @type {Integer (Int32)}
     */
    static Positionstatic => 1

    /**
     * Native name: stylePositionrelative
     * @type {Integer (Int32)}
     */
    static Positionrelative => 2

    /**
     * Native name: stylePositionabsolute
     * @type {Integer (Int32)}
     */
    static Positionabsolute => 3

    /**
     * Native name: stylePositionfixed
     * @type {Integer (Int32)}
     */
    static Positionfixed => 4

    /**
     * Native name: stylePositionMsPage
     * @type {Integer (Int32)}
     */
    static MsPage => 5

    /**
     * Native name: stylePositionMsDeviceFixed
     * @type {Integer (Int32)}
     */
    static MsDeviceFixed => 6

    /**
     * Native name: stylePosition_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
