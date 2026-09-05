#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
class INTERNET_PER_CONN extends Win32Enum {

    /**
     * Native name: INTERNET_PER_CONN_AUTOCONFIG_URL
     * @type {Integer (UInt32)}
     */
    static AUTOCONFIG_URL => 4

    /**
     * Native name: INTERNET_PER_CONN_AUTODISCOVERY_FLAGS
     * @type {Integer (UInt32)}
     */
    static AUTODISCOVERY_FLAGS => 5

    /**
     * Native name: INTERNET_PER_CONN_FLAGS
     * @type {Integer (UInt32)}
     */
    static FLAGS => 1

    /**
     * Native name: INTERNET_PER_CONN_PROXY_BYPASS
     * @type {Integer (UInt32)}
     */
    static PROXY_BYPASS => 3

    /**
     * Native name: INTERNET_PER_CONN_PROXY_SERVER
     * @type {Integer (UInt32)}
     */
    static PROXY_SERVER => 2

    /**
     * Native name: INTERNET_PER_CONN_AUTOCONFIG_SECONDARY_URL
     * @type {Integer (UInt32)}
     */
    static AUTOCONFIG_SECONDARY_URL => 6

    /**
     * Native name: INTERNET_PER_CONN_AUTOCONFIG_RELOAD_DELAY_MINS
     * @type {Integer (UInt32)}
     */
    static AUTOCONFIG_RELOAD_DELAY_MINS => 7

    /**
     * Native name: INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_TIME
     * @type {Integer (UInt32)}
     */
    static AUTOCONFIG_LAST_DETECT_TIME => 8

    /**
     * Native name: INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_URL
     * @type {Integer (UInt32)}
     */
    static AUTOCONFIG_LAST_DETECT_URL => 9
}
