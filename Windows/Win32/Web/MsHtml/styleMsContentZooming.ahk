#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsContentZooming extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomingNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomingNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZoomingZoom => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleMsContentZooming_Max => 2147483647
}
