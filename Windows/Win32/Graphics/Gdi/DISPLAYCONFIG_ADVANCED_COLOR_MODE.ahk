#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DISPLAYCONFIG_ADVANCED_COLOR_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ADVANCED_COLOR_MODE_SDR => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ADVANCED_COLOR_MODE_WCG => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_ADVANCED_COLOR_MODE_HDR => 2
}
