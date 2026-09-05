#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleListStylePosition extends Win32Enum {

    /**
     * Native name: styleListStylePositionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleListStylePositionInside
     * @type {Integer (Int32)}
     */
    static Inside => 1

    /**
     * Native name: styleListStylePositionOutSide
     * @type {Integer (Int32)}
     */
    static OutSide => 2

    /**
     * Native name: styleListStylePosition_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
