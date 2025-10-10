#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The QOS_FLOWRATE_OUTGOING structure is used to set flow rate information in the QOSSetFlow function.
 * @see https://docs.microsoft.com/windows/win32/api//qos2/ns-qos2-qos_flowrate_outgoing
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_FLOWRATE_OUTGOING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The rate at which data should be sent, in units of bits per second.
     * 
     * <div class="alert"><b>Note</b>  Traffic on the network is measured at the IP level, and not at the application level.  The rate that is specified should account for the IP and protocol headers.</div>
     * <div> </div>
     * @type {Integer}
     */
    Bandwidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_shaping">QOS_SHAPING</a> constant that defines the shaping behavior of the flow.
     * @type {Integer}
     */
    ShapingBehavior {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/qos2/ne-qos2-qos_flowrate_reason">QOS_FLOWRATE_REASON</a> constant that indicates the reason for a flow rate change.
     * @type {Integer}
     */
    Reason {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
