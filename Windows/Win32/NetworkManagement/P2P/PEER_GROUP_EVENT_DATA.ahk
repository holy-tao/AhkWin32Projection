#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PEER_EVENT_MEMBER_CHANGE_DATA.ahk" { PEER_EVENT_MEMBER_CHANGE_DATA }
#Import ".\PEER_GROUP_STATUS.ahk" { PEER_GROUP_STATUS }
#Import ".\PEER_EVENT_INCOMING_DATA.ahk" { PEER_EVENT_INCOMING_DATA }
#Import ".\PEER_EVENT_RECORD_CHANGE_DATA.ahk" { PEER_EVENT_RECORD_CHANGE_DATA }
#Import ".\PEER_RECORD_CHANGE_TYPE.ahk" { PEER_RECORD_CHANGE_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_CONNECTION_STATUS.ahk" { PEER_CONNECTION_STATUS }
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PEER_GROUP_EVENT_TYPE.ahk" { PEER_GROUP_EVENT_TYPE }
#Import ".\PEER_EVENT_CONNECTION_CHANGE_DATA.ahk" { PEER_EVENT_CONNECTION_CHANGE_DATA }
#Import ".\PEER_MEMBER_CHANGE_TYPE.ahk" { PEER_MEMBER_CHANGE_TYPE }

/**
 * The PEER_GROUP_EVENT_DATA structure (p2p.h) contains information about a specific peer group event that has occurred.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_group_event_data~r1
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_GROUP_EVENT_DATA {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_event_type">PEER_GROUP_EVENT_TYPE</a> enumeration value that specifies  the type of peer group event that occurred. The type of event dictates the subsequent structure chosen from the union; for example, if this value is set to PEER_GROUP_EVENT_INCOMING_DATA, the populated union member is  <b>incomingData</b>.
     * @deprecated
     */
    eventType : PEER_GROUP_EVENT_TYPE

    /**
     * @deprecated
     */
    dwStatus : PEER_GROUP_STATUS

    static __New() {
        DefineProp(this.Prototype, 'incomingData', { type: PEER_EVENT_INCOMING_DATA, offset: 8 })
        DefineProp(this.Prototype, 'recordChangeData', { type: PEER_EVENT_RECORD_CHANGE_DATA, offset: 8 })
        DefineProp(this.Prototype, 'connectionChangeData', { type: PEER_EVENT_CONNECTION_CHANGE_DATA, offset: 8 })
        DefineProp(this.Prototype, 'memberChangeData', { type: PEER_EVENT_MEMBER_CHANGE_DATA, offset: 8 })
        DefineProp(this.Prototype, 'hrConnectionFailedReason', { type: HRESULT, offset: 8 })
        this.DeleteProp("__New")
    }
}
