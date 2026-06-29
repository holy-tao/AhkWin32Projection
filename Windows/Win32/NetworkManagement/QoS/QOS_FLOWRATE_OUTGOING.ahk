#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_SHAPING.ahk" { QOS_SHAPING }
#Import ".\QOS_FLOWRATE_REASON.ahk" { QOS_FLOWRATE_REASON }

/**
 * The QOS_FLOWRATE_OUTGOING structure is used to set flow rate information in the QOSSetFlow function.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ns-qos2-qos_flowrate_outgoing
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_FLOWRATE_OUTGOING {
    #StructPack 8

    /**
     * The rate at which data should be sent, in units of bits per second.
     * 
     * <div class="alert"><b>Note</b>  Traffic on the network is measured at the IP level, and not at the application level.  The rate that is specified should account for the IP and protocol headers.</div>
     * <div> </div>
     */
    Bandwidth : Int64

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_shaping">QOS_SHAPING</a> constant that defines the shaping behavior of the flow.
     */
    ShapingBehavior : QOS_SHAPING

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_flowrate_reason">QOS_FLOWRATE_REASON</a> constant that indicates the reason for a flow rate change.
     */
    Reason : QOS_FLOWRATE_REASON

}
