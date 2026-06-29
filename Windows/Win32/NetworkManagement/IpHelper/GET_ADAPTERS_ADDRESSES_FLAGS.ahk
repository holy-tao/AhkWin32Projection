#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct GET_ADAPTERS_ADDRESSES_FLAGS {
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
    static GAA_FLAG_SKIP_UNICAST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_SKIP_ANYCAST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_SKIP_MULTICAST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_SKIP_DNS_SERVER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_INCLUDE_PREFIX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_SKIP_FRIENDLY_NAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_INCLUDE_WINS_INFO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_INCLUDE_GATEWAYS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_INCLUDE_ALL_INTERFACES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_INCLUDE_ALL_COMPARTMENTS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static GAA_FLAG_INCLUDE_TUNNEL_BINDINGORDER => 1024
}
