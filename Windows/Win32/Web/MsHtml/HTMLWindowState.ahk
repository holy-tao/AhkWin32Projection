#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class HTMLWindowState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTMLWindowStateNormal => 1

    /**
     * @type {Integer (Int32)}
     */
    static HTMLWindowStateMaximize => 3

    /**
     * @type {Integer (Int32)}
     */
    static HTMLWindowStateMinimize => 6

    /**
     * @type {Integer (Int32)}
     */
    static HTMLWindowState_Max => 2147483647
}
