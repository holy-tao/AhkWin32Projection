#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class htmlCaptionAlign extends Win32Enum {

    /**
     * Native name: htmlCaptionAlignNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: htmlCaptionAlignLeft
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * Native name: htmlCaptionAlignCenter
     * @type {Integer (Int32)}
     */
    static Center => 2

    /**
     * Native name: htmlCaptionAlignRight
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * Native name: htmlCaptionAlignJustify
     * @type {Integer (Int32)}
     */
    static Justify => 4

    /**
     * Native name: htmlCaptionAlignTop
     * @type {Integer (Int32)}
     */
    static Top => 5

    /**
     * Native name: htmlCaptionAlignBottom
     * @type {Integer (Int32)}
     */
    static Bottom => 6

    /**
     * Native name: htmlCaptionAlign_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
