#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The QOS_PACKET_PRIORITY structure that indicates the priority of the flow traffic.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ns-qos2-qos_packet_priority
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_PACKET_PRIORITY {
    #StructPack 4

    /**
     * Differential Services Code Point (DSCP) mark used for flow traffic that conforms to the specified flow rate.
     */
    ConformantDSCPValue : UInt32

    /**
     * DSCP marking used for flow traffic that exceeds the specified flow rate.  Non-conformant DSCP values are only applicable only if <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_shaping">QOS_SHAPING</a> has a value of <b>QOSUseNonConformantMarkings</b>.
     */
    NonConformantDSCPValue : UInt32

    /**
     * Layer-2 (L2) tag used for flow traffic that conforms to the specified flow rate. L2 tags will not be added to packets if the end-to-end path between source and sink does not support them.
     */
    ConformantL2Value : UInt32

    /**
     * L2 tag used for flow traffic that exceeds the specified flow rate.  Non-conformant L2 values are only applicable if <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_shaping">QOS_SHAPING</a> has a value of <b>QOSUseNonConformantMarkings</b>.
     */
    NonConformantL2Value : UInt32

}
