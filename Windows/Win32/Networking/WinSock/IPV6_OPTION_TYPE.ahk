#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV6_OPTION_TYPE {
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
    static IP6OPT_PAD1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_PADN => 1

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_TUNNEL_LIMIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_ROUTER_ALERT => 5

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_JUMBO => 194

    /**
     * @type {Integer (Int32)}
     */
    static IP6OPT_NSAP_ADDR => 195
}
