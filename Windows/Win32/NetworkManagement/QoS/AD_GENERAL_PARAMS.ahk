#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The AD_GENERAL_PARAMS structure contains the General Characterization Parameters contained in the RSVP Adspec object.
 * @see https://learn.microsoft.com/windows/win32/api/qossp/ns-qossp-ad_general_params
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct AD_GENERAL_PARAMS {
    #StructPack 4

    /**
     * Number of hops that conform to Integrated Services (INTSERV) requirements.
     */
    IntServAwareHopCount : UInt32

    /**
     * Minimum bandwidth available from sender to receiver.
     */
    PathBandwidthEstimate : UInt32

    /**
     * Sum of the minimum latency of the packet forwarding process in routers, in milliseconds. Can be set to INDETERMINATE_LATENCY.
     */
    MinimumLatency : UInt32

    /**
     * Maximum Transmission Unit (MTU) for the end-to-end path between sender and receiver that will not incur packet fragmentation.
     */
    PathMTU : UInt32

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
     */
    Flags : UInt32

}
