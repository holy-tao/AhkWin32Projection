#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }
#Import "..\..\Networking\WinSock\FLOWSPEC.ahk" { FLOWSPEC }

/**
 * The TC_GEN_FLOW structure creates a generic flow for use with the traffic control interface. The flow is customized through the members of this structure.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-tc_gen_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct TC_GEN_FLOW {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure for the sending direction of the flow.
     */
    SendingFlowspec : FLOWSPEC

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/qos/ns-qos-flowspec">FLOWSPEC</a> structure for the receiving direction of the flow.
     */
    ReceivingFlowspec : FLOWSPEC

    /**
     * Length of <b>TcObjects</b>, in bytes.
     */
    TcObjectsLength : UInt32

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
     */
    TcObjects : QOS_OBJECT_HDR[1]

}
