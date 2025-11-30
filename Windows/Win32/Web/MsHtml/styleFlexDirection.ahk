#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleFlexDirection extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionRow => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionRowReverse => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionColumn => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionColumnReverse => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirectionNotSet => 4

    /**
     * @type {Integer (Int32)}
     */
    static styleFlexDirection_Max => 2147483647
}
