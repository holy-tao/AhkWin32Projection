#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IPSEC_DOSP_STATISTICS0 structure.
 * @remarks
 * <b>IPSEC_DOSP_STATISTICS0</b> is a specific implementation of IPSEC_DOSP_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_DOSP_STATISTICS0 {
    #StructPack 8

    /**
     * The total number of state entries that have been created since the computer was last started.
     */
    totalStateEntriesCreated : Int64

    /**
     * The current number of state entries in the table.
     */
    currentStateEntries : Int64

    /**
     * The total number of inbound IPv6 IPsec unauthenticated packets that have been allowed since the computer was last started.
     */
    totalInboundAllowedIPv6IPsecUnauthPkts : Int64

    /**
     * The total number of inbound IPv6 IPsec unauthenticated packets that have been discarded due to rate limiting since the computer was last started.
     */
    totalInboundRatelimitDiscardedIPv6IPsecUnauthPkts : Int64

    /**
     * The total number of inbound IPv6 IPsec unauthenticated packets that have been discarded due to per internal IP address rate limiting since the computer was last started.
     */
    totalInboundPerIPRatelimitDiscardedIPv6IPsecUnauthPkts : Int64

    /**
     * The total number of inbound IPV6 IPsec unauthenticated packets that have been discarded due to all other reasons since the computer was last started.
     */
    totalInboundOtherDiscardedIPv6IPsecUnauthPkts : Int64

    /**
     * The total number of inbound IPv6 IPsec authenticated packets that have been allowed since the computer was last started.
     */
    totalInboundAllowedIPv6IPsecAuthPkts : Int64

    /**
     * The total number of inbound IPv6 IPsec authenticated packets that have been discarded due to rate limiting since the computer was last started.
     */
    totalInboundRatelimitDiscardedIPv6IPsecAuthPkts : Int64

    /**
     * The total number of inbound IPV6 IPsec authenticated packets that have been discarded due to all other reasons since the computer was last started.
     */
    totalInboundOtherDiscardedIPv6IPsecAuthPkts : Int64

    /**
     * The total number of inbound ICMPv6 packets that have been allowed since the computer was last started.
     */
    totalInboundAllowedICMPv6Pkts : Int64

    /**
     * The total number of inbound ICMPv6 packets that have been discarded due to rate limiting since the computer was last started.
     */
    totalInboundRatelimitDiscardedICMPv6Pkts : Int64

    /**
     * The total number of inbound IPv6 filter exempted packets that have been allowed since the computer was last started.
     */
    totalInboundAllowedIPv6FilterExemptPkts : Int64

    /**
     * The total number of inbound IPv6 filter exempted packets that have been discarded due to rate limiting since the computer was last started.
     */
    totalInboundRatelimitDiscardedIPv6FilterExemptPkts : Int64

    /**
     * The total number of inbound IPv6 filter blocked packets that have been discarded since the computer was last started.
     */
    totalInboundDiscardedIPv6FilterBlockPkts : Int64

    /**
     * The total number of inbound default-block exempted packets that have been allowed since the computer was last started.
     */
    totalInboundAllowedDefBlockExemptPkts : Int64

    /**
     * The total number of inbound default-block exempted packets that have been discarded due to rate limiting since the computer was last started.
     */
    totalInboundRatelimitDiscardedDefBlockExemptPkts : Int64

    /**
     * The total number of inbound default-block packets that have been discarded since the computer was last started.
     */
    totalInboundDiscardedDefBlockPkts : Int64

    /**
     * The current number of per internal IP address rate limit queues for inbound IPv6 unauthenticated IPsec traffic.
     */
    currentInboundIPv6IPsecUnauthPerIPRateLimitQueues : Int64

}
