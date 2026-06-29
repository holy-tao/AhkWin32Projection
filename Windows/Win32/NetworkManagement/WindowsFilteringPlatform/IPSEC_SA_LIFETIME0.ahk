#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores the lifetime in seconds/kilobytes/packets for an IPsec security association (SA).
 * @remarks
 * <b>IPSEC_SA_LIFETIME0</b> is a specific implementation of IPSEC_SA_LIFETIME. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_sa_lifetime0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_SA_LIFETIME0 {
    #StructPack 4

    /**
     * SA lifetime in seconds.
     */
    lifetimeSeconds : UInt32

    /**
     * SA lifetime in kilobytes.
     */
    lifetimeKilobytes : UInt32

    /**
     * SA lifetime in packets.
     */
    lifetimePackets : UInt32

}
