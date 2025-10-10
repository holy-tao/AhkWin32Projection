#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The QOS_TCP_TRAFFIC structure is used to indicate that IP Precedence and UserPriority mappings for a given flow must be set to system defaults for TCP traffic.
 * @remarks
 * 
  * When the <b>QOS_TCP_TRAFFIC</b> object is passed, the <b>DSField</b> mapping and <b>UserPriorityMapping</b> of <b>ServiceType</b> are ignored, as are QOS_OBJECT_DS_CLASS and QOS_OBJECT_TRAFFIC_CLASS.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qosobjs/ns-qosobjs-qos_tcp_traffic
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_TCP_TRAFFIC extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A QOS object header.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(this.ptr + 0)
            return this.__ObjectHdr
        }
    }
}
