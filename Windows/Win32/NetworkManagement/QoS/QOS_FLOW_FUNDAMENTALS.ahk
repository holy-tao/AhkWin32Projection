#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The QOS_FLOW_FUNDAMENTALS structure contains basic information about a flow.
 * @see https://docs.microsoft.com/windows/win32/api//qos2/ns-qos2-qos_flow_fundamentals
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
    BottleneckBandwidthSet{
        get {
            if(!this.HasProp("__BottleneckBandwidthSet"))
                this.__BottleneckBandwidthSet := BOOL(this.ptr + 0)
            return this.__BottleneckBandwidthSet
        }
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
    AvailableBandwidthSet{
        get {
            if(!this.HasProp("__AvailableBandwidthSet"))
                this.__AvailableBandwidthSet := BOOL(this.ptr + 16)
            return this.__AvailableBandwidthSet
        }
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
    RTTSet{
        get {
            if(!this.HasProp("__RTTSet"))
                this.__RTTSet := BOOL(this.ptr + 32)
            return this.__RTTSet
        }
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
