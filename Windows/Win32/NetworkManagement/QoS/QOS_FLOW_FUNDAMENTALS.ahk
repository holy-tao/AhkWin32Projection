#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The QOS_FLOW_FUNDAMENTALS structure contains basic information about a flow.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ns-qos2-qos_flow_fundamentals
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_FLOW_FUNDAMENTALS {
    #StructPack 8

    /**
     * This Boolean value is set to <b>TRUE</b> if the <b>BottleneckBandwidth</b> field contains a value.
     */
    BottleneckBandwidthSet : BOOL

    /**
     * Indicates the maximum end-to-end link capacity between the source and sink device, in bits.
     */
    BottleneckBandwidth : Int64

    /**
     * Set to <b>TRUE</b> if the <b>AvailableBandwidth</b> field contains a value.
     */
    AvailableBandwidthSet : BOOL

    /**
     * Indicates  how much bandwidth is available for submitting traffic on the end-to-end network path between the source and sink device, in bits.
     */
    AvailableBandwidth : Int64

    /**
     * Set to <b>TRUE</b> if the <b>RTT</b> field contains a value.
     */
    RTTSet : BOOL

    /**
     * Measures the round-trip time between the source and sink device, in microseconds.
     */
    RTT : UInt32

}
