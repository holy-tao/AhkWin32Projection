#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleBoxSizing extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleBoxSizingNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBoxSizingContentBox => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBoxSizingBorderBox => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBoxSizing_Max => 2147483647
}
