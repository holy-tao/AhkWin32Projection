#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_SA_BUNDLE_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_ND_SECURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_ND_BOUNDARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_ND_PEER_NAT_BOUNDARY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_GUARANTEE_ENCRYPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_ALLOW_NULL_TARGET_NAME_MATCH => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_CLEAR_DF_ON_TUNNEL => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_ASSUME_UDP_CONTEXT_OUTBOUND => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_ND_PEER_BOUNDARY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_SUPPRESS_DUPLICATE_DELETION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_BUNDLE_FLAG_PEER_SUPPORTS_GUARANTEE_ENCRYPTION => 16384
}
