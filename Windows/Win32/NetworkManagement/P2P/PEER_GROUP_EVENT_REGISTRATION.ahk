#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEER_GROUP_EVENT_TYPE.ahk" { PEER_GROUP_EVENT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_GROUP_EVENT_REGISTRATION structure defines the particular peer group event a member can register for.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_group_event_registration
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_GROUP_EVENT_REGISTRATION {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_event_type">PEER_GROUP_EVENT_TYPE</a> that specifies the peer group event type to register for.
     * @deprecated
     */
    eventType : PEER_GROUP_EVENT_TYPE

    /**
     * GUID value that identifies the type of record or data message that  raises an event of the type specified by <b>eventType</b>. For example, if the peer wishes to be notified about all changes to a specific record type,  the GUID that corresponds to this record type must be supplied in this field and PEER_GROUP_RECORD_CHANGED must be in <b>eventType</b>.
     * 
     * This member is only populated (not NULL) when <b>eventType</b> is either PEER_GROUP_EVENT_RECORD_CHANGED or PEER_GROUP_EVENT_INCOMING_DATA.
     */
    pType : Guid.Ptr

}
