#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class HTMLBorderStyle extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyleNormal => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyleRaised => 256

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyleSunken => 512

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStylecombined => 768

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyleStatic => 131072

    /**
     * @type {Integer (Int32)}
     */
    static HTMLBorderStyle_Max => 2147483647
}
