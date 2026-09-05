#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleTextUnderlinePosition extends Win32Enum {

    /**
     * Native name: styleTextUnderlinePositionBelow
     * @type {Integer (Int32)}
     */
    static Below => 0

    /**
     * Native name: styleTextUnderlinePositionAbove
     * @type {Integer (Int32)}
     */
    static Above => 1

    /**
     * Native name: styleTextUnderlinePositionAuto
     * @type {Integer (Int32)}
     */
    static Auto => 2

    /**
     * Native name: styleTextUnderlinePositionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 3

    /**
     * Native name: styleTextUnderlinePosition_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
