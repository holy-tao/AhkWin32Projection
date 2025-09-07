#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\QOS_OBJECT_HDR.ahk

/**
 * The QOS_FRIENDLY_NAME traffic control object associates a friendly name with flow.
 * @remarks
 * Programmers are encouraged to use the 
  * <b>QOS_FRIENDLY_NAME</b> traffic control object to associate flows with their applications. This approach enables management applications to identify and associate enumerated flows with corresponding applications.
 * @see https://learn.microsoft.com/windows/win32/api/qosobjs/ns-qosobjs-qos_friendly_name
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_FRIENDLY_NAME extends Win32Struct
{
    static sizeof => 520

    static packingSize => 8

    /**
     * The QOS object 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/qos/ns-qos-qos_object_hdr">QOS_OBJECT_HDR</a>. The object type for this traffic control object should be 
     * <b>QOS_OBJECT_FRIENDLY_NAME</b>.
     * @type {QOS_OBJECT_HDR}
     */
    ObjectHdr{
        get {
            if(!this.HasProp("__ObjectHdr"))
                this.__ObjectHdr := QOS_OBJECT_HDR(this.ptr + 0)
            return this.__ObjectHdr
        }
    }

    /**
     * Name to be associated with the flow.
     * @type {String}
     */
    FriendlyName {
        get => StrGet(this.ptr + 8, 255, "UTF-16")
        set => StrPut(value, this.ptr + 8, 255, "UTF-16")
    }
}
