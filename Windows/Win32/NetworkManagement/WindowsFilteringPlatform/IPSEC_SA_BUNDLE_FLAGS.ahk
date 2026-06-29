#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_BUNDLE_FLAGS {
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
