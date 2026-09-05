#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class IPSEC_SA_BUNDLE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_ND_SECURE
     * @type {Integer (UInt32)}
     */
    static FLAG_ND_SECURE => 1

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_ND_BOUNDARY
     * @type {Integer (UInt32)}
     */
    static FLAG_ND_BOUNDARY => 2

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_ND_PEER_NAT_BOUNDARY
     * @type {Integer (UInt32)}
     */
    static FLAG_ND_PEER_NAT_BOUNDARY => 4

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_GUARANTEE_ENCRYPTION
     * @type {Integer (UInt32)}
     */
    static FLAG_GUARANTEE_ENCRYPTION => 8

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_ALLOW_NULL_TARGET_NAME_MATCH
     * @type {Integer (UInt32)}
     */
    static FLAG_ALLOW_NULL_TARGET_NAME_MATCH => 512

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_CLEAR_DF_ON_TUNNEL
     * @type {Integer (UInt32)}
     */
    static FLAG_CLEAR_DF_ON_TUNNEL => 1024

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_ASSUME_UDP_CONTEXT_OUTBOUND
     * @type {Integer (UInt32)}
     */
    static FLAG_ASSUME_UDP_CONTEXT_OUTBOUND => 2048

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_ND_PEER_BOUNDARY
     * @type {Integer (UInt32)}
     */
    static FLAG_ND_PEER_BOUNDARY => 4096

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_SUPPRESS_DUPLICATE_DELETION
     * @type {Integer (UInt32)}
     */
    static FLAG_SUPPRESS_DUPLICATE_DELETION => 8192

    /**
     * Native name: IPSEC_SA_BUNDLE_FLAG_PEER_SUPPORTS_GUARANTEE_ENCRYPTION
     * @type {Integer (UInt32)}
     */
    static FLAG_PEER_SUPPORTS_GUARANTEE_ENCRYPTION => 16384
}
