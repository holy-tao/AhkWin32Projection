#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleBackgroundClip extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundClipBorderBox => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundClipPaddingBox => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundClipContentBox => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundClipNotSet => 3

    /**
     * @type {Integer (Int32)}
     */
    static styleBackgroundClip_Max => 2147483647
}
