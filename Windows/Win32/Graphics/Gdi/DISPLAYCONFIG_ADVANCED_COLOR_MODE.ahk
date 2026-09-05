#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class DISPLAYCONFIG_ADVANCED_COLOR_MODE extends Win32Enum {

    /**
     * Native name: DISPLAYCONFIG_ADVANCED_COLOR_MODE_SDR
     * @type {Integer (Int32)}
     */
    static SDR => 0

    /**
     * Native name: DISPLAYCONFIG_ADVANCED_COLOR_MODE_WCG
     * @type {Integer (Int32)}
     */
    static WCG => 1

    /**
     * Native name: DISPLAYCONFIG_ADVANCED_COLOR_MODE_HDR
     * @type {Integer (Int32)}
     */
    static HDR => 2
}
