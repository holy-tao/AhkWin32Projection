#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }

/**
 * The QOS_TCP_TRAFFIC structure is used to indicate that IP Precedence and UserPriority mappings for a given flow must be set to system defaults for TCP traffic.
 * @remarks
 * When the <b>QOS_TCP_TRAFFIC</b> object is passed, the <b>DSField</b> mapping and <b>UserPriorityMapping</b> of <b>ServiceType</b> are ignored, as are QOS_OBJECT_DS_CLASS and QOS_OBJECT_TRAFFIC_CLASS.
 * @see https://learn.microsoft.com/windows/win32/api/qosobjs/ns-qosobjs-qos_tcp_traffic
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_TCP_TRAFFIC {
    #StructPack 4

    /**
     * A QOS object header.
     */
    ObjectHdr : QOS_OBJECT_HDR

}
