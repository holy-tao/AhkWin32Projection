#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores aggregate IPsec kernel security association (SA) statistics.
 * @remarks
 * <b>IPSEC_AGGREGATE_SA_STATISTICS0</b> is a specific implementation of IPSEC_AGGREGATE_SA_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_aggregate_sa_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IPSEC_AGGREGATE_SA_STATISTICS0 {
    #StructPack 4

    /**
     * Number of active SAs.
     */
    activeSas : UInt32

    /**
     * Number of pending SA negotiations.
     */
    pendingSaNegotiations : UInt32

    /**
     * Total number of SAs added.
     */
    totalSasAdded : UInt32

    /**
     * Total number of SAs deleted.
     */
    totalSasDeleted : UInt32

    /**
     * Number of successful re-keys.
     */
    successfulRekeys : UInt32

    /**
     * Number of active tunnels.
     */
    activeTunnels : UInt32

    /**
     * Number of offloaded SAs.
     */
    offloadedSas : UInt32

}
