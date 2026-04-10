#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class HTMLBorder extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderThick => 262144

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderDialog => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderThin => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorder_Max => 2147483647
}
