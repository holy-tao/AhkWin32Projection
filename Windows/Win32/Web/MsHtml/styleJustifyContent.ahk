#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleJustifyContent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentFlexStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentFlexEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentSpaceBetween => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentSpaceAround => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContentNotSet => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleJustifyContent_Max => 2147483647
}
