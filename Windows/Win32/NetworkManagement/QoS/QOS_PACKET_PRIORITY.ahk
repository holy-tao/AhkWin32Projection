#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The QOS_PACKET_PRIORITY structure that indicates the priority of the flow traffic.
 * @see https://docs.microsoft.com/windows/win32/api//qos2/ns-qos2-qos_packet_priority
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_PACKET_PRIORITY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Differential Services Code Point (DSCP) mark used for flow traffic that conforms to the specified flow rate.
     * @type {Integer}
     */
    ConformantDSCPValue {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * DSCP marking used for flow traffic that exceeds the specified flow rate.  Non-conformant DSCP values are only applicable only if <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_shaping">QOS_SHAPING</a> has a value of <b>QOSUseNonConformantMarkings</b>.
     * @type {Integer}
     */
    NonConformantDSCPValue {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Layer-2 (L2) tag used for flow traffic that conforms to the specified flow rate. L2 tags will not be added to packets if the end-to-end path between source and sink does not support them.
     * @type {Integer}
     */
    ConformantL2Value {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * L2 tag used for flow traffic that exceeds the specified flow rate.  Non-conformant L2 values are only applicable if <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_shaping">QOS_SHAPING</a> has a value of <b>QOSUseNonConformantMarkings</b>.
     * @type {Integer}
     */
    NonConformantL2Value {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
