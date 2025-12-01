#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The traffic control object QOS_TRAFFIC_CLASS is used to override the default UserPriority value ascribed to packets that classify the traffic of a given flow.
 * @remarks
 * <b>Traffic Control:  </b>The following <b>ServiceType</b> enumeration values are invalid when specifically working with Traffic Control. <dl>
 * <dd>SERVICE_NO_TRAFFIC_CONTROL</dd>
 * <dd>SERVICE_NO_QOS_SIGNALING</dd>
 * <dd>SERVICETYPE_GENERAL_INFORMATION</dd>
 * <dd>SERVICETYPE_NETWORK_UNAVAILABLE</dd>
 * <dd>SERVICETYPE_NOCHANGE</dd>
 * <dd>SERVICETYPE_NOTRAFFIC</dd>
 * </dl>
 * @see https://learn.microsoft.com/windows/win32/api/qosobjs/ns-qosobjs-qos_traffic_class
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_TRAFFIC_CLASS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this traffic control object should be 
     * <b>QOS_OBJECT_TRAFFIC_CLASS</b>.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(0, this)
            return this.__ObjectHdr
        }
    }

    /**
     * User priority value of the flow. The valid range is zero through seven. The following settings are chosen (by default) when the 
     * <b>QOS_TRAFFIC_CLASS</b> traffic control object is not used.
     * 
     * <div class="alert"><b>Note</b>  This parameter specifies an 802.1 TrafficClass parameter which has been provided to the host by a layer 2 network 
     * in an 802.1 extended RSVP RESV message. If this object is obtained
     * from the network, hosts will stamp the MAC headers of corresponding
     * transmitted packets, with the value in the object. Otherwise, hosts
     * can select a value based on the standard Intserv mapping of 
     * ServiceType to 802.1 TrafficClass.</div>
     * <div> </div>
     * @type {Integer}
     */
    TrafficClass {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
