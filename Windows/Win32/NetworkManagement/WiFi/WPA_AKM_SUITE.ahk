#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WPA_AKM_SUITE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static wpa_akm_none => 15880192

    /**
     * @type {Integer (Int32)}
     */
    static wpa_akm_1x => 32657408

    /**
     * @type {Integer (Int32)}
     */
    static wpa_akm_psk => 49434624

    /**
     * @type {Integer (Int32)}
     */
    static wpa_akm_max => 49434624
}
