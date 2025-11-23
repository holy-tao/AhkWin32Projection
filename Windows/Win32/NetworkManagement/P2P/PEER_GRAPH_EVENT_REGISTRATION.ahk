#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PEER_GRAPH_EVENT_REGISTRATION structure is used during registration for peer event notification. During registration it specifies which peer events an application requires notifications for.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_graph_event_registration
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GRAPH_EVENT_REGISTRATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the type of peer event the application requires notifications for. The per events that can be registered for are specified by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_graph_event_type">PEER_GRAPH_EVENT_TYPE</a> enumeration.
     * @deprecated 
     * @type {Integer}
     */
    eventType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * If the peer event specified by  <b>eventType</b>  relates to records, use this member to specify which types of records the application requires notifications for.  Specify <b>NULL</b> to receive notifications for all record types.   This member is ignored if the  event specified by <b>eventType</b> does not relate to  records.
     * @type {Pointer<Guid>}
     */
    pType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
