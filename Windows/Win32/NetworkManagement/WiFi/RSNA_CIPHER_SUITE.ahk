#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class RSNA_CIPHER_SUITE extends Win32Enum {

    /**
     * Native name: rsna_cipher_group
     * @type {Integer (Int32)}
     */
    static group => 11276032

    /**
     * Native name: rsna_cipher_wep40
     * @type {Integer (Int32)}
     */
    static wep40 => 28053248

    /**
     * Native name: rsna_cipher_tkip
     * @type {Integer (Int32)}
     */
    static tkip => 44830464

    /**
     * Native name: rsna_cipher_reserved
     * @type {Integer (Int32)}
     */
    static reserved => 61607680

    /**
     * Native name: rsna_cipher_ccmp_128
     * @type {Integer (Int32)}
     */
    static ccmp_128 => 78384896

    /**
     * Native name: rsna_cipher_wep104
     * @type {Integer (Int32)}
     */
    static wep104 => 95162112

    /**
     * Native name: rsna_cipher_bip_cmac_128
     * @type {Integer (Int32)}
     */
    static bip_cmac_128 => 111939328

    /**
     * Native name: rsna_cipher_no_group_traffic
     * @type {Integer (Int32)}
     */
    static no_group_traffic => 128716544

    /**
     * Native name: rsna_cipher_gcmp_128
     * @type {Integer (Int32)}
     */
    static gcmp_128 => 145493760

    /**
     * Native name: rsna_cipher_gcmp_256
     * @type {Integer (Int32)}
     */
    static gcmp_256 => 162270976

    /**
     * Native name: rsna_cipher_ccmp_256
     * @type {Integer (Int32)}
     */
    static ccmp_256 => 179048192

    /**
     * Native name: rsna_cipher_bip_gmac_128
     * @type {Integer (Int32)}
     */
    static bip_gmac_128 => 195825408

    /**
     * Native name: rsna_cipher_bip_gmac_256
     * @type {Integer (Int32)}
     */
    static bip_gmac_256 => 212602624

    /**
     * Native name: rsna_cipher_bip_cmac_256
     * @type {Integer (Int32)}
     */
    static bip_cmac_256 => 229379840

    /**
     * Native name: rsna_cipher_max
     * @type {Integer (Int32)}
     */
    static max => 229379840
}
