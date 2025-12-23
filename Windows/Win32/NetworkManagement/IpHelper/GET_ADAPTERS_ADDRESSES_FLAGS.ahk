#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class GET_ADAPTERS_ADDRESSES_FLAGS extends Win32BitflagEnum{

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
