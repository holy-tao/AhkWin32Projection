#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DSI_CONTROL_TRANSMISSION_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DCT_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DCT_FORCE_LOW_POWER => 1

    /**
     * @type {Integer (Int32)}
     */
    static DCT_FORCE_HIGH_PERFORMANCE => 2
}
