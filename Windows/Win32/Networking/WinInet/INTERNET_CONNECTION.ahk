#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct INTERNET_CONNECTION {
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
    static INTERNET_CONNECTION_CONFIGURED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CONNECTION_LAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CONNECTION_MODEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CONNECTION_MODEM_BUSY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CONNECTION_OFFLINE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_CONNECTION_PROXY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static INTERNET_RAS_INSTALLED => 16
}
