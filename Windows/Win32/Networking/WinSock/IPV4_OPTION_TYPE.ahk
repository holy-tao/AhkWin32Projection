#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IPV4_OPTION_TYPE {
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
    static IP_OPT_EOL => 0

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_NOP => 1

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_SECURITY => 130

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_LSRR => 131

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_TS => 68

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_RR => 7

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_SSRR => 137

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_SID => 136

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_ROUTER_ALERT => 148

    /**
     * @type {Integer (Int32)}
     */
    static IP_OPT_MULTIDEST => 149
}
