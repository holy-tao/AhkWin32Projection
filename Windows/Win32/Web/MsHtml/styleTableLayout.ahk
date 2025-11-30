#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleTableLayout extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleTableLayoutNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleTableLayoutAuto => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleTableLayoutFixed => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleTableLayout_Max => 2147483647
}
