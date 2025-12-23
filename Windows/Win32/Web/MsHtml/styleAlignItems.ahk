#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleAlignItems extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignItemsFlexStart => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignItemsFlexEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignItemsCenter => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignItemsBaseline => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignItemsStretch => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignItemsNotSet => 5

    /**
     * @type {Integer (Int32)}
     */
    static styleAlignItems_Max => 2147483647
}
