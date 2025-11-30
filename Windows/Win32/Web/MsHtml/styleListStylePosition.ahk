#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleListStylePosition extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleListStylePositionNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleListStylePositionInside => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleListStylePositionOutSide => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleListStylePosition_Max => 2147483647
}
