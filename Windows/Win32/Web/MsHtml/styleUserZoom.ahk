#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class styleUserZoom extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static styleUserZoomNotSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleUserZoomZoom => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleUserZoomFixed => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleUserZoom_Max => 2147483647
}
