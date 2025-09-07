#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines a wireless LAN authentication algorithm.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-auth-algorithm
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_AUTH_ALGORITHM{

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_80211_OPEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_80211_SHARED_KEY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_WPA => 3

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_WPA_PSK => 4

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_WPA_NONE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_RSNA => 6

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_RSNA_PSK => 7

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_WPA3 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_WPA3_ENT_192 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_WPA3_SAE => 9

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_OWE => 10

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_WPA3_ENT => 11

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_IHV_START => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DOT11_AUTH_ALGO_IHV_END => -1
}
