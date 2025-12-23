#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class htmlCaptionVAlign extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static htmlCaptionVAlignNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static htmlCaptionVAlignTop => 1

    /**
     * @type {Integer (Int32)}
     */
    static htmlCaptionVAlignBottom => 2

    /**
     * @type {Integer (Int32)}
     */
    static htmlCaptionVAlign_Max => 2147483647
}
