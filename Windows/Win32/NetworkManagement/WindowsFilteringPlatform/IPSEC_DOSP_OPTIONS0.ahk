#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_V6_ADDR_AND_MASK.ahk" { FWP_V6_ADDR_AND_MASK }
#Import ".\IPSEC_DOSP_FLAGS.ahk" { IPSEC_DOSP_FLAGS }

/**
 * Used to store configuration parameters for IPsec DoS Protection.
 * @remarks
 * <b>IPSEC_DOSP_OPTIONS0</b> is a specific implementation of IPSEC_DOSP_OPTIONS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_options0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_DOSP_OPTIONS0 {
    #StructPack 8

    /**
     * The number of seconds before idle timeout. This value must be greater than 0.
     */
    stateIdleTimeoutSeconds : UInt32

    /**
     * The idle timeout for the per IP rate limit queue object. This value must be greater than 0.
     */
    perIPRateLimitQueueIdleTimeoutSeconds : UInt32

    /**
     * The DSCP marking for unauthenticated inbound IPv6 IPsec traffic. This value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     */
    ipV6IPsecUnauthDscp : Int8

    /**
     * The rate limit for unauthenticated inbound IPv6 IPsec traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     */
    ipV6IPsecUnauthRateLimitBytesPerSec : UInt32

    /**
     * The rate limit for unauthenticated inbound IPv6 IPsec traffic per internal IP address. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     */
    ipV6IPsecUnauthPerIPRateLimitBytesPerSec : UInt32

    /**
     * The DSCP marking for authenticated inbound IPv6 IPsec traffic. The value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     */
    ipV6IPsecAuthDscp : Int8

    /**
     * The rate limit for authenticated inbound IPv6 IPsec traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category..
     */
    ipV6IPsecAuthRateLimitBytesPerSec : UInt32

    /**
     * The DSCP marking for  inbound ICMPv6 traffic. The value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     */
    icmpV6Dscp : Int8

    /**
     * The rate limit for  inbound ICMPv6 traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     */
    icmpV6RateLimitBytesPerSec : UInt32

    /**
     * The DSCP marking for  inbound IPv6 filter exempted traffic. The value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     */
    ipV6FilterExemptDscp : Int8

    /**
     * The rate limit for  inbound IPV6 filter exempted traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     */
    ipV6FilterExemptRateLimitBytesPerSec : UInt32

    /**
     * The DSCP marking for  inbound default-block exempted traffic. The value must be less than or equal to 63. Specify IPSEC_DOSP_DSCP_DISABLE_VALUE to disable DSCP marking for this category.
     */
    defBlockExemptDscp : Int8

    /**
     * The rate limit for  inbound default-block exempted traffic. Specify IPSEC_DOSP_RATE_LIMIT_DISABLE_VALUE to disable rate limiting for this category.
     */
    defBlockExemptRateLimitBytesPerSec : UInt32

    /**
     * The maximum number of state entries in the table. The value must be greater than 0.
     */
    maxStateEntries : UInt32

    /**
     * The maximum number of rate limit queues for inbound unauthenticated IPv6 IPsec traffic per internal IP address. The value must be greater than 0.
     */
    maxPerIPRateLimitQueues : UInt32

    flags : IPSEC_DOSP_FLAGS

    /**
     * The number  of public Internet facing interface identifiers for which DOS protection should be enabled.
     */
    numPublicIFLuids : UInt32

    /**
     * Pointer to an array of public Internet facing interface identifiers for which DOS protection should be enabled.
     */
    publicIFLuids : IntPtr

    /**
     * The number of internal network facing interface identifiers for which DOS protection should be enabled.
     */
    numInternalIFLuids : UInt32

    /**
     * Pointer to an array of internal network facing interface identifiers for which DOS protection should be enabled.
     */
    internalIFLuids : IntPtr

    /**
     * Optional public IPv6 address or subnet for this policy, as specified in [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask).
     */
    publicV6AddrMask : FWP_V6_ADDR_AND_MASK

    /**
     * Optional internal IPv6 address or subnet for this policy, as specified in [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask).
     */
    internalV6AddrMask : FWP_V6_ADDR_AND_MASK

}
