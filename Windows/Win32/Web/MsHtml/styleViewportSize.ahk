#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class styleViewportSize extends Win32Enum {

    /**
     * Native name: styleViewportSizeAuto
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Native name: styleViewportSizeDeviceWidth
     * @type {Integer (Int32)}
     */
    static DeviceWidth => 1

    /**
     * Native name: styleViewportSizeDeviceHeight
     * @type {Integer (Int32)}
     */
    static DeviceHeight => 2

    /**
     * Native name: styleViewportSize_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
