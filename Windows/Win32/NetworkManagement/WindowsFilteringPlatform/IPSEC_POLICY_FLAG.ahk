#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_POLICY_FLAG extends Win32BitflagEnum {

    /**
     * Native name: IPSEC_POLICY_FLAG_ND_SECURE
     * @type {Integer (UInt32)}
     */
    static ND_SECURE => 2

    /**
     * Native name: IPSEC_POLICY_FLAG_ND_BOUNDARY
     * @type {Integer (UInt32)}
     */
    static ND_BOUNDARY => 4

    /**
     * Native name: IPSEC_POLICY_FLAG_NAT_ENCAP_ALLOW_PEER_BEHIND_NAT
     * @type {Integer (UInt32)}
     */
    static NAT_ENCAP_ALLOW_PEER_BEHIND_NAT => 16

    /**
     * Native name: IPSEC_POLICY_FLAG_NAT_ENCAP_ALLOW_GENERAL_NAT_TRAVERSAL
     * @type {Integer (UInt32)}
     */
    static NAT_ENCAP_ALLOW_GENERAL_NAT_TRAVERSAL => 32

    /**
     * Native name: IPSEC_POLICY_FLAG_DONT_NEGOTIATE_SECOND_LIFETIME
     * @type {Integer (UInt32)}
     */
    static DONT_NEGOTIATE_SECOND_LIFETIME => 64

    /**
     * Native name: IPSEC_POLICY_FLAG_DONT_NEGOTIATE_BYTE_LIFETIME
     * @type {Integer (UInt32)}
     */
    static DONT_NEGOTIATE_BYTE_LIFETIME => 128

    /**
     * Native name: IPSEC_POLICY_FLAG_CLEAR_DF_ON_TUNNEL
     * @type {Integer (UInt32)}
     */
    static CLEAR_DF_ON_TUNNEL => 8

    /**
     * Native name: IPSEC_POLICY_FLAG_ENABLE_V6_IN_V4_TUNNELING
     * @type {Integer (UInt32)}
     */
    static ENABLE_V6_IN_V4_TUNNELING => 256

    /**
     * Native name: IPSEC_POLICY_FLAG_ENABLE_SERVER_ADDR_ASSIGNMENT
     * @type {Integer (UInt32)}
     */
    static ENABLE_SERVER_ADDR_ASSIGNMENT => 512

    /**
     * Native name: IPSEC_POLICY_FLAG_TUNNEL_ALLOW_OUTBOUND_CLEAR_CONNECTION
     * @type {Integer (UInt32)}
     */
    static TUNNEL_ALLOW_OUTBOUND_CLEAR_CONNECTION => 1024

    /**
     * Native name: IPSEC_POLICY_FLAG_TUNNEL_BYPASS_ALREADY_SECURE_CONNECTION
     * @type {Integer (UInt32)}
     */
    static TUNNEL_BYPASS_ALREADY_SECURE_CONNECTION => 2048

    /**
     * Native name: IPSEC_POLICY_FLAG_TUNNEL_BYPASS_ICMPV6
     * @type {Integer (UInt32)}
     */
    static TUNNEL_BYPASS_ICMPV6 => 4096

    /**
     * Native name: IPSEC_POLICY_FLAG_KEY_MANAGER_ALLOW_DICTATE_KEY
     * @type {Integer (UInt32)}
     */
    static KEY_MANAGER_ALLOW_DICTATE_KEY => 8192
}
