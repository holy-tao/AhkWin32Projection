#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PEER_GRAPH_EVENT_TYPE.ahk" { PEER_GRAPH_EVENT_TYPE }

/**
 * The PEER_GRAPH_EVENT_REGISTRATION structure is used during registration for peer event notification. During registration it specifies which peer events an application requires notifications for.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_graph_event_registration
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_GRAPH_EVENT_REGISTRATION {
    #StructPack 8

    /**
     * Specifies the type of peer event the application requires notifications for. The per events that can be registered for are specified by the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_graph_event_type">PEER_GRAPH_EVENT_TYPE</a> enumeration.
     * @deprecated
     */
    eventType : PEER_GRAPH_EVENT_TYPE

    /**
     * If the peer event specified by  <b>eventType</b>  relates to records, use this member to specify which types of records the application requires notifications for.  Specify <b>NULL</b> to receive notifications for all record types.   This member is ignored if the  event specified by <b>eventType</b> does not relate to  records.
     */
    pType : Guid.Ptr

}
