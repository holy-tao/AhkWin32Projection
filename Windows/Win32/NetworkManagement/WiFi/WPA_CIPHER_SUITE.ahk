#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class WPA_CIPHER_SUITE extends Win32Enum {

    /**
     * Native name: wpa_cipher_none
     * @type {Integer (Int32)}
     */
    static none => 15880192

    /**
     * Native name: wpa_cipher_wep40
     * @type {Integer (Int32)}
     */
    static wep40 => 32657408

    /**
     * Native name: wpa_cipher_tkip
     * @type {Integer (Int32)}
     */
    static tkip => 49434624

    /**
     * Native name: wpa_cipher_ccmp_128
     * @type {Integer (Int32)}
     */
    static ccmp_128 => 82989056

    /**
     * Native name: wpa_cipher_wep104
     * @type {Integer (Int32)}
     */
    static wep104 => 99766272

    /**
     * Native name: wpa_cipher_bip_cmac_128
     * @type {Integer (Int32)}
     */
    static bip_cmac_128 => 116543488

    /**
     * Native name: wpa_cipher_max
     * @type {Integer (Int32)}
     */
    static max => 116543488
}
