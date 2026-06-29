#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }

/**
 * The QOS_DIFFSERV traffic control object is used to specify filters for the packet scheduler when it operates in Differentiated Services Mode.
 * @remarks
 * The 
 * <b>QOS_DIFFSERV</b> object is used to specify the set of Diffserv rules that apply to the specified flow, all of which are specified in the <b>DiffservRule</b> member. Each Diffserv rule has an InboundDSField value, which signifies the DSCP on the Inbound packet. The Diffserv Rules also have OutboundDSCP and UserPriority values for conforming and nonconforming packets. These indicate the DSCP and 802.1p values that go out on the forwarded packet. Note that the DSCP or UserPriority mapping based on ServiceType or 
 * <b>QOS_DS_CLASS</b> or 
 * <b>QOS_TRAFFIC_CLASS</b> is not used in this mode.
 * @see https://learn.microsoft.com/windows/win32/api/qosobjs/ns-qosobjs-qos_diffserv
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_DIFFSERV {
    #StructPack 4

    /**
     * The QOS object 
     * <b>QOS_OBJECT_HDR</b>. The object type for this traffic control object should be 
     * QOS_OBJECT_DIFFSERV.
     */
    ObjectHdr : QOS_OBJECT_HDR

    /**
     * Number of Diffserv Rules in this object.
     */
    DSFieldCount : UInt32

    /**
     * Array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/qosobjs/ns-qosobjs-qos_diffserv_rule">QOS_DIFFSERV_RULE</a> structures.
     */
    DiffservRule : Int8[1]

}
