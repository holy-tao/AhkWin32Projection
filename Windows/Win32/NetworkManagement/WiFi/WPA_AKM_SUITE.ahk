#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WPA_AKM_SUITE extends Win32Enum {

    /**
     * Native name: wpa_akm_none
     * @type {Integer (Int32)}
     */
    static none => 15880192

    /**
     * Native name: wpa_akm_1x
     * @type {Integer (Int32)}
     */
    static 1x => 32657408

    /**
     * Native name: wpa_akm_psk
     * @type {Integer (Int32)}
     */
    static psk => 49434624

    /**
     * Native name: wpa_akm_max
     * @type {Integer (Int32)}
     */
    static max => 49434624
}
