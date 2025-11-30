#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class HTMLCaptionFlag extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HTMLCaptionFlagNo => 0

    /**
     * @type {Integer (Int32)}
     */
    static HTMLCaptionFlagYes => 12582912

    /**
     * @type {Integer (Int32)}
     */
    static HTMLCaptionFlag_Max => 2147483647
}
