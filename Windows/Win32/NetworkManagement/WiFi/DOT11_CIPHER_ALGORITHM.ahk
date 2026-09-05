#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines a cipher algorithm for data encryption and decryption.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-cipher-algorithm
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_CIPHER_ALGORITHM extends Win32Enum {

    /**
     * Native name: DOT11_CIPHER_ALGO_NONE
     * @type {Integer (Int32)}
     */
    static ALGO_NONE => 0

    /**
     * Native name: DOT11_CIPHER_ALGO_WEP40
     * @type {Integer (Int32)}
     */
    static ALGO_WEP40 => 1

    /**
     * Native name: DOT11_CIPHER_ALGO_TKIP
     * @type {Integer (Int32)}
     */
    static ALGO_TKIP => 2

    /**
     * Native name: DOT11_CIPHER_ALGO_CCMP
     * @type {Integer (Int32)}
     */
    static ALGO_CCMP => 4

    /**
     * Native name: DOT11_CIPHER_ALGO_WEP104
     * @type {Integer (Int32)}
     */
    static ALGO_WEP104 => 5

    /**
     * Native name: DOT11_CIPHER_ALGO_BIP
     * @type {Integer (Int32)}
     */
    static ALGO_BIP => 6

    /**
     * Native name: DOT11_CIPHER_ALGO_GCMP
     * @type {Integer (Int32)}
     */
    static ALGO_GCMP => 8

    /**
     * Native name: DOT11_CIPHER_ALGO_GCMP_256
     * @type {Integer (Int32)}
     */
    static ALGO_GCMP_256 => 9

    /**
     * Native name: DOT11_CIPHER_ALGO_CCMP_256
     * @type {Integer (Int32)}
     */
    static ALGO_CCMP_256 => 10

    /**
     * Native name: DOT11_CIPHER_ALGO_BIP_GMAC_128
     * @type {Integer (Int32)}
     */
    static ALGO_BIP_GMAC_128 => 11

    /**
     * Native name: DOT11_CIPHER_ALGO_BIP_GMAC_256
     * @type {Integer (Int32)}
     */
    static ALGO_BIP_GMAC_256 => 12

    /**
     * Native name: DOT11_CIPHER_ALGO_BIP_CMAC_256
     * @type {Integer (Int32)}
     */
    static ALGO_BIP_CMAC_256 => 13

    /**
     * Native name: DOT11_CIPHER_ALGO_WPA_USE_GROUP
     * @type {Integer (Int32)}
     */
    static ALGO_WPA_USE_GROUP => 256

    /**
     * Native name: DOT11_CIPHER_ALGO_RSN_USE_GROUP
     * @type {Integer (Int32)}
     */
    static ALGO_RSN_USE_GROUP => 256

    /**
     * Native name: DOT11_CIPHER_ALGO_WEP
     * @type {Integer (Int32)}
     */
    static ALGO_WEP => 257

    /**
     * Native name: DOT11_CIPHER_ALGO_IHV_START
     * @type {Integer (Int32)}
     */
    static ALGO_IHV_START => -2147483648

    /**
     * Native name: DOT11_CIPHER_ALGO_IHV_END
     * @type {Integer (Int32)}
     */
    static ALGO_IHV_END => -1
}
