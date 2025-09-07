#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_POLICY_FLAG{

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_ND_SECURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_ND_BOUNDARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_NAT_ENCAP_ALLOW_PEER_BEHIND_NAT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_NAT_ENCAP_ALLOW_GENERAL_NAT_TRAVERSAL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_DONT_NEGOTIATE_SECOND_LIFETIME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_DONT_NEGOTIATE_BYTE_LIFETIME => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_CLEAR_DF_ON_TUNNEL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_ENABLE_V6_IN_V4_TUNNELING => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_ENABLE_SERVER_ADDR_ASSIGNMENT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_TUNNEL_ALLOW_OUTBOUND_CLEAR_CONNECTION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_TUNNEL_BYPASS_ALREADY_SECURE_CONNECTION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_TUNNEL_BYPASS_ICMPV6 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_POLICY_FLAG_KEY_MANAGER_ALLOW_DICTATE_KEY => 8192
}
