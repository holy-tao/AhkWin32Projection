#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLDlgBorder extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgBorderThin => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgBorderThick => 262144

    /**
     * @type {Integer (Int32)}
     */
    static HTMLDlgBorder_Max => 2147483647
}
