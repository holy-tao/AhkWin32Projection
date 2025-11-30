#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class HTMLSysMenuFlag extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTMLSysMenuFlagNo => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLSysMenuFlagYes => 524288

    /**
     * @type {Integer (Int32)}
     */
    static HTMLSysMenuFlag_Max => 2147483647
}
