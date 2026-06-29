#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ND_OPTION_TYPE {
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
    static ND_OPT_SOURCE_LINKADDR => 1

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_TARGET_LINKADDR => 2

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_PREFIX_INFORMATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_REDIRECTED_HEADER => 4

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_MTU => 5

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_NBMA_SHORTCUT_LIMIT => 6

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_ADVERTISEMENT_INTERVAL => 7

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_HOME_AGENT_INFORMATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_SOURCE_ADDR_LIST => 9

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_TARGET_ADDR_LIST => 10

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_ROUTE_INFO => 24

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_RDNSS => 25

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_DNSSL => 31

    /**
     * @type {Integer (Int32)}
     */
    static ND_OPT_PREF64 => 38
}
