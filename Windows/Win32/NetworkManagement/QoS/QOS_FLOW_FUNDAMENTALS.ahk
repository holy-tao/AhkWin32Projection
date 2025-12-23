#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The QOS_FLOW_FUNDAMENTALS structure contains basic information about a flow.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ns-qos2-qos_flow_fundamentals
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_FLOW_FUNDAMENTALS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * This Boolean value is set to <b>TRUE</b> if the <b>BottleneckBandwidth</b> field contains a value.
     * @type {BOOL}
     */
    BottleneckBandwidthSet {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Indicates the maximum end-to-end link capacity between the source and sink device, in bits.
     * @type {Integer}
     */
    BottleneckBandwidth {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Set to <b>TRUE</b> if the <b>AvailableBandwidth</b> field contains a value.
     * @type {BOOL}
     */
    AvailableBandwidthSet {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Indicates  how much bandwidth is available for submitting traffic on the end-to-end network path between the source and sink device, in bits.
     * @type {Integer}
     */
    AvailableBandwidth {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Set to <b>TRUE</b> if the <b>RTT</b> field contains a value.
     * @type {BOOL}
     */
    RTTSet {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Measures the round-trip time between the source and sink device, in microseconds.
     * @type {Integer}
     */
    RTT {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
