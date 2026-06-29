#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\QOS_OBJECT_HDR.ahk" { QOS_OBJECT_HDR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The QOS_FRIENDLY_NAME traffic control object associates a friendly name with flow.
 * @remarks
 * Programmers are encouraged to use the 
 * <b>QOS_FRIENDLY_NAME</b> traffic control object to associate flows with their applications. This approach enables management applications to identify and associate enumerated flows with corresponding applications.
 * @see https://learn.microsoft.com/windows/win32/api/qosobjs/ns-qosobjs-qos_friendly_name
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_FRIENDLY_NAME {
    #StructPack 4

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this traffic control object should be 
     * <b>QOS_OBJECT_FRIENDLY_NAME</b>.
     */
    ObjectHdr : QOS_OBJECT_HDR

    /**
     * Name to be associated with the flow.
     */
    FriendlyName : WCHAR[256]

}
