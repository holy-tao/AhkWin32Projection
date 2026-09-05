#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleMsContentZooming extends Win32Enum {

    /**
     * Native name: styleMsContentZoomingNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleMsContentZoomingNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: styleMsContentZoomingZoom
     * @type {Integer (Int32)}
     */
    static Zoom => 2

    /**
     * Native name: styleMsContentZooming_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
