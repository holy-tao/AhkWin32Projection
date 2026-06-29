#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NLA_CONNECTIVITY_TYPE {
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
    static NLA_NETWORK_AD_HOC => 0

    /**
     * @type {Integer (Int32)}
     */
    static NLA_NETWORK_MANAGED => 1

    /**
     * @type {Integer (Int32)}
     */
    static NLA_NETWORK_UNMANAGED => 2

    /**
     * @type {Integer (Int32)}
     */
    static NLA_NETWORK_UNKNOWN => 3
}
