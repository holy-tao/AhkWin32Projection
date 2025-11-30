#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WPA_CIPHER_SUITE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_none => 15880192

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_wep40 => 32657408

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_tkip => 49434624

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_ccmp_128 => 82989056

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_wep104 => 99766272

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_bip_cmac_128 => 116543488

    /**
     * @type {Integer (Int32)}
     */
    static wpa_cipher_max => 116543488
}
