#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct DNS_CONNECTION_PROXY_INFO_SWITCH {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_INFO_SWITCH_CONFIG => 0

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_INFO_SWITCH_SCRIPT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DNS_CONNECTION_PROXY_INFO_SWITCH_WPAD => 2
}
