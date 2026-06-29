#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used to store state information for IPsec DoS Protection.
 * @remarks
 * <b>IPSEC_DOSP_STATE0</b> is a specific implementation of IPSEC_DOSP_STATE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_dosp_state0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_DOSP_STATE0 {
    #StructPack 8

    /**
     * The IPv6 address of the public host.
     */
    publicHostV6Addr : Int8[16]

    /**
     * The IPv6 address of the internal host.
     */
    internalHostV6Addr : Int8[16]

    /**
     * The total number of inbound IPv6 IPsec packets that have been allowed since the state entry was created.
     */
    totalInboundIPv6IPsecAuthPackets : Int64

    /**
     * The total number of outbound IPv6 IPsec packets that have been allowed since the state entry was created.
     */
    totalOutboundIPv6IPsecAuthPackets : Int64

    /**
     * The duration, in seconds, since the state entry was created.
     */
    durationSecs : UInt32

}
