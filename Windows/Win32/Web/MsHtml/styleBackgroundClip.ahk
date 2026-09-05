#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBackgroundClip extends Win32Enum {

    /**
     * Native name: styleBackgroundClipBorderBox
     * @type {Integer (Int32)}
     */
    static BorderBox => 0

    /**
     * Native name: styleBackgroundClipPaddingBox
     * @type {Integer (Int32)}
     */
    static PaddingBox => 1

    /**
     * Native name: styleBackgroundClipContentBox
     * @type {Integer (Int32)}
     */
    static ContentBox => 2

    /**
     * Native name: styleBackgroundClipNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 3

    /**
     * Native name: styleBackgroundClip_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
