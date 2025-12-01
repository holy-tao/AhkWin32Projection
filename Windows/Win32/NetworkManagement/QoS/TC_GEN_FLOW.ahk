#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Networking\WinSock\FLOWSPEC.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The TC_GEN_FLOW structure creates a generic flow for use with the traffic control interface. The flow is customized through the members of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-tc_gen_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class TC_GEN_FLOW extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure for the sending direction of the flow.
     * @type {FLOWSPEC}
     */
    SendingFlowspec{
        get {
            if(!this.HasProp("__SendingFlowspec"))
                this.__SendingFlowspec := FLOWSPEC(0, this)
            return this.__SendingFlowspec
        }
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure for the receiving direction of the flow.
     * @type {FLOWSPEC}
     */
    ReceivingFlowspec{
        get {
            if(!this.HasProp("__ReceivingFlowspec"))
                this.__ReceivingFlowspec := FLOWSPEC(32, this)
            return this.__ReceivingFlowspec
        }
    }

    /**
     * Length of <b>TcObjects</b>, in bytes.
     * @type {Integer}
     */
    TcObjectsLength {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Buffer that contains an array of traffic control objects specific to the given flow. The <b>TcObjects</b> member can contain objects from the list of currently supported objects. Definitions of these objects can be found in Qos.h and Traffic.h: 
     * 
     * 
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_ds_class">QOS_DS_CLASS</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_traffic_class">QOS_TRAFFIC_CLASS</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv">QOS_DIFFSERV</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-qos_sd_mode">QOS_SD_MODE</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-qos_shaping_rate">QOS_SHAPING_RATE</a>
     * 
     * 
     * QOS_OBJECT_END_OF_LIST
     * @type {Array<QOS_OBJECT_HDR>}
     */
    TcObjects{
        get {
            if(!this.HasProp("__TcObjectsProxyArray"))
                this.__TcObjectsProxyArray := Win32FixedArray(this.ptr + 72, 1, QOS_OBJECT_HDR, "")
            return this.__TcObjectsProxyArray
        }
    }
}
