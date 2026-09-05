#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBoxSizing extends Win32Enum {

    /**
     * Native name: styleBoxSizingNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleBoxSizingContentBox
     * @type {Integer (Int32)}
     */
    static ContentBox => 1

    /**
     * Native name: styleBoxSizingBorderBox
     * @type {Integer (Int32)}
     */
    static BorderBox => 2

    /**
     * Native name: styleBoxSizing_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
