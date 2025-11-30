#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleTextUnderlinePosition extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleTextUnderlinePositionBelow => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTextUnderlinePositionAbove => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTextUnderlinePositionAuto => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTextUnderlinePositionNotSet => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleTextUnderlinePosition_Max => 2147483647
}
