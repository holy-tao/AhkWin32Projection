#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_PER_CONN {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_AUTOCONFIG_URL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_AUTODISCOVERY_FLAGS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_PROXY_BYPASS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_PROXY_SERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_AUTOCONFIG_SECONDARY_URL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_AUTOCONFIG_RELOAD_DELAY_MINS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_TIME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_PER_CONN_AUTOCONFIG_LAST_DETECT_URL => 9
}
