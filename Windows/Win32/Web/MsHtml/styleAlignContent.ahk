#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleAlignContent extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentFlexStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentFlexEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentSpaceBetween => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentSpaceAround => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentStretch => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContentNotSet => 6

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignContent_Max => 2147483647
}
