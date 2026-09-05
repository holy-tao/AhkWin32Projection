#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines a wireless LAN authentication algorithm.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-auth-algorithm
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
class DOT11_AUTH_ALGORITHM extends Win32Enum {

    /**
     * Native name: DOT11_AUTH_ALGO_80211_OPEN
     * @type {Integer (Int32)}
     */
    static ALGO_80211_OPEN => 1

    /**
     * Native name: DOT11_AUTH_ALGO_80211_SHARED_KEY
     * @type {Integer (Int32)}
     */
    static ALGO_80211_SHARED_KEY => 2

    /**
     * Native name: DOT11_AUTH_ALGO_WPA
     * @type {Integer (Int32)}
     */
    static ALGO_WPA => 3

    /**
     * Native name: DOT11_AUTH_ALGO_WPA_PSK
     * @type {Integer (Int32)}
     */
    static ALGO_WPA_PSK => 4

    /**
     * Native name: DOT11_AUTH_ALGO_WPA_NONE
     * @type {Integer (Int32)}
     */
    static ALGO_WPA_NONE => 5

    /**
     * Native name: DOT11_AUTH_ALGO_RSNA
     * @type {Integer (Int32)}
     */
    static ALGO_RSNA => 6

    /**
     * Native name: DOT11_AUTH_ALGO_RSNA_PSK
     * @type {Integer (Int32)}
     */
    static ALGO_RSNA_PSK => 7

    /**
     * Native name: DOT11_AUTH_ALGO_WPA3
     * @type {Integer (Int32)}
     */
    static ALGO_WPA3 => 8

    /**
     * Native name: DOT11_AUTH_ALGO_WPA3_ENT_192
     * @type {Integer (Int32)}
     */
    static ALGO_WPA3_ENT_192 => 8

    /**
     * Native name: DOT11_AUTH_ALGO_WPA3_SAE
     * @type {Integer (Int32)}
     */
    static ALGO_WPA3_SAE => 9

    /**
     * Native name: DOT11_AUTH_ALGO_OWE
     * @type {Integer (Int32)}
     */
    static ALGO_OWE => 10

    /**
     * Native name: DOT11_AUTH_ALGO_WPA3_ENT
     * @type {Integer (Int32)}
     */
    static ALGO_WPA3_ENT => 11

    /**
     * Native name: DOT11_AUTH_ALGO_IHV_START
     * @type {Integer (Int32)}
     */
    static ALGO_IHV_START => -2147483648

    /**
     * Native name: DOT11_AUTH_ALGO_IHV_END
     * @type {Integer (Int32)}
     */
    static ALGO_IHV_END => -1
}
