#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleUserZoom extends Win32Enum {

    /**
     * Native name: styleUserZoomNotSet
     * @type {Integer (Int32)}
     */
    static NotSet => 0

    /**
     * Native name: styleUserZoomZoom
     * @type {Integer (Int32)}
     */
    static Zoom => 1

    /**
     * Native name: styleUserZoomFixed
     * @type {Integer (Int32)}
     */
    static Fixed => 2

    /**
     * Native name: styleUserZoom_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
