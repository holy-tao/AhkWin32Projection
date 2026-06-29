#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct ICMP4_UNREACH_CODE {
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
    static ICMP4_UNREACH_NET => 0

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_HOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_PROTOCOL => 2

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_PORT => 3

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_FRAG_NEEDED => 4

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_SOURCEROUTE_FAILED => 5

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_NET_UNKNOWN => 6

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_HOST_UNKNOWN => 7

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_ISOLATED => 8

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_NET_ADMIN => 9

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_HOST_ADMIN => 10

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_NET_TOS => 11

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_HOST_TOS => 12

    /**
     * @type {Integer (Int32)}
     */
    static ICMP4_UNREACH_ADMIN => 13
}
