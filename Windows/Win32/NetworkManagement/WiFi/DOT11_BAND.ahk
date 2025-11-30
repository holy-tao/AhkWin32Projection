#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_BAND extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_band_2p4g => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_band_4p9g => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_band_5g => 3
}
