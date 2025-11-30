#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class HTMLMaximizeFlag extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTMLMaximizeFlagNo => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLMaximizeFlagYes => 65536

    /**
     * @type {Integer (Int32)}
     */
    static HTMLMaximizeFlag_Max => 2147483647
}
