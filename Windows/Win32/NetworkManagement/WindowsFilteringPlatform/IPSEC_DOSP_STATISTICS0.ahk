#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IPSEC_DOSP_STATISTICS0 structure.
 * @remarks
 * <b>IPSEC_DOSP_STATISTICS0</b> is a specific implementation of IPSEC_DOSP_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_DOSP_STATISTICS0 extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * The total number of state entries that have been created since the computer was last started.
     * @type {Integer}
     */
    totalStateEntriesCreated {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The current number of state entries in the table.
     * @type {Integer}
     */
    currentStateEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The total number of inbound IPv6 IPsec unauthenticated packets that have been allowed since the computer was last started.
     * @type {Integer}
     */
    totalInboundAllowedIPv6IPsecUnauthPkts {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The total number of inbound IPv6 IPsec unauthenticated packets that have been discarded due to rate limiting since the computer was last started.
     * @type {Integer}
     */
    totalInboundRatelimitDiscardedIPv6IPsecUnauthPkts {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The total number of inbound IPv6 IPsec unauthenticated packets that have been discarded due to per internal IP address rate limiting since the computer was last started.
     * @type {Integer}
     */
    totalInboundPerIPRatelimitDiscardedIPv6IPsecUnauthPkts {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The total number of inbound IPV6 IPsec unauthenticated packets that have been discarded due to all other reasons since the computer was last started.
     * @type {Integer}
     */
    totalInboundOtherDiscardedIPv6IPsecUnauthPkts {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The total number of inbound IPv6 IPsec authenticated packets that have been allowed since the computer was last started.
     * @type {Integer}
     */
    totalInboundAllowedIPv6IPsecAuthPkts {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The total number of inbound IPv6 IPsec authenticated packets that have been discarded due to rate limiting since the computer was last started.
     * @type {Integer}
     */
    totalInboundRatelimitDiscardedIPv6IPsecAuthPkts {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The total number of inbound IPV6 IPsec authenticated packets that have been discarded due to all other reasons since the computer was last started.
     * @type {Integer}
     */
    totalInboundOtherDiscardedIPv6IPsecAuthPkts {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The total number of inbound ICMPv6 packets that have been allowed since the computer was last started.
     * @type {Integer}
     */
    totalInboundAllowedICMPv6Pkts {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The total number of inbound ICMPv6 packets that have been discarded due to rate limiting since the computer was last started.
     * @type {Integer}
     */
    totalInboundRatelimitDiscardedICMPv6Pkts {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The total number of inbound IPv6 filter exempted packets that have been allowed since the computer was last started.
     * @type {Integer}
     */
    totalInboundAllowedIPv6FilterExemptPkts {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The total number of inbound IPv6 filter exempted packets that have been discarded due to rate limiting since the computer was last started.
     * @type {Integer}
     */
    totalInboundRatelimitDiscardedIPv6FilterExemptPkts {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The total number of inbound IPv6 filter blocked packets that have been discarded since the computer was last started.
     * @type {Integer}
     */
    totalInboundDiscardedIPv6FilterBlockPkts {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The total number of inbound default-block exempted packets that have been allowed since the computer was last started.
     * @type {Integer}
     */
    totalInboundAllowedDefBlockExemptPkts {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * The total number of inbound default-block exempted packets that have been discarded due to rate limiting since the computer was last started.
     * @type {Integer}
     */
    totalInboundRatelimitDiscardedDefBlockExemptPkts {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * The total number of inbound default-block packets that have been discarded since the computer was last started.
     * @type {Integer}
     */
    totalInboundDiscardedDefBlockPkts {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The current number of per internal IP address rate limit queues for inbound IPv6 unauthenticated IPsec traffic.
     * @type {Integer}
     */
    currentInboundIPv6IPsecUnauthPerIPRateLimitQueues {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
