#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores aggregate IPsec kernel security association (SA) statistics.
 * @remarks
 * <b>IPSEC_AGGREGATE_SA_STATISTICS0</b> is a specific implementation of IPSEC_AGGREGATE_SA_STATISTICS. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/ipsectypes/ns-ipsectypes-ipsec_aggregate_sa_statistics0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IPSEC_AGGREGATE_SA_STATISTICS0 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Number of active SAs.
     * @type {Integer}
     */
    activeSas {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of pending SA negotiations.
     * @type {Integer}
     */
    pendingSaNegotiations {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Total number of SAs added.
     * @type {Integer}
     */
    totalSasAdded {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Total number of SAs deleted.
     * @type {Integer}
     */
    totalSasDeleted {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of successful re-keys.
     * @type {Integer}
     */
    successfulRekeys {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of active tunnels.
     * @type {Integer}
     */
    activeTunnels {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of offloaded SAs.
     * @type {Integer}
     */
    offloadedSas {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
