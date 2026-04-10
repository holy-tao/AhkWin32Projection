#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleViewportSize extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static styleViewportSizeAuto => 0

    /**
     * @type {Integer (Int32)}
     */
    static styleViewportSizeDeviceWidth => 1

    /**
     * @type {Integer (Int32)}
     */
    static styleViewportSizeDeviceHeight => 2

    /**
     * @type {Integer (Int32)}
     */
    static styleViewportSize_Max => 2147483647
}
