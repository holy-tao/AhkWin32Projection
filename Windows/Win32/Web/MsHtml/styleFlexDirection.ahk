#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleFlexDirection extends Win32Enum {

    /**
     * Native name: styleFlexDirectionRow
     * @type {Integer (Int32)}
     */
    static Row => 0

    /**
     * Native name: styleFlexDirectionRowReverse
     * @type {Integer (Int32)}
     */
    static RowReverse => 1

    /**
     * Native name: styleFlexDirectionColumn
     * @type {Integer (Int32)}
     */
    static Column => 2

    /**
     * Native name: styleFlexDirectionColumnReverse
     * @type {Integer (Int32)}
     */
    static ColumnReverse => 3

    /**
     * Native name: styleFlexDirectionNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 4

    /**
     * Native name: styleFlexDirection_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
