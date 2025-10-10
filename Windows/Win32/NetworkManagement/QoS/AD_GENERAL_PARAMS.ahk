#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AD_GENERAL_PARAMS structure contains the General Characterization Parameters contained in the RSVP Adspec object.
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ns-qossp-ad_general_params
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class AD_GENERAL_PARAMS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Number of hops that conform to Integrated Services (INTSERV) requirements.
     * @type {Integer}
     */
    IntServAwareHopCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Minimum bandwidth available from sender to receiver.
     * @type {Integer}
     */
    PathBandwidthEstimate {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Sum of the minimum latency of the packet forwarding process in routers, in milliseconds. Can be set to INDETERMINATE_LATENCY.
     * @type {Integer}
     */
    MinimumLatency {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Maximum Transmission Unit (MTU) for the end-to-end path between sender and receiver that will not incur packet fragmentation.
     * @type {Integer}
     */
    PathMTU {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Flags associated with the parameters. The following flag is supported:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="AD_FLAG_BREAK_BIT"></a><a id="ad_flag_break_bit"></a><dl>
     * <dt><b>AD_FLAG_BREAK_BIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates the existence of a network element in the data path that does not support QOS control services. When set in a specific service override, indicates QOS service was not supported on at least one hop.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
