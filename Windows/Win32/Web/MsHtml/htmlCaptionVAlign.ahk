#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlCaptionVAlign extends Win32Enum {

    /**
     * Native name: htmlCaptionVAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlCaptionVAlignTop
     * @type {Integer (Int32)}
     */
    static Top => 1

    /**
     * Native name: htmlCaptionVAlignBottom
     * @type {Integer (Int32)}
     */
    static Bottom => 2

    /**
     * Native name: htmlCaptionVAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
