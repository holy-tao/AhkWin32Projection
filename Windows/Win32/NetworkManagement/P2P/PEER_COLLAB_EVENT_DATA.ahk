#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA.ahk" { PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA }
#Import ".\PEER_OBJECT.ahk" { PEER_OBJECT }
#Import ".\PEER_EVENT_ENDPOINT_CHANGED_DATA.ahk" { PEER_EVENT_ENDPOINT_CHANGED_DATA }
#Import ".\PEER_EVENT_WATCHLIST_CHANGED_DATA.ahk" { PEER_EVENT_WATCHLIST_CHANGED_DATA }
#Import ".\PEER_ENDPOINT.ahk" { PEER_ENDPOINT }
#Import ".\PEER_PEOPLE_NEAR_ME.ahk" { PEER_PEOPLE_NEAR_ME }
#Import ".\PEER_CHANGE_TYPE.ahk" { PEER_CHANGE_TYPE }
#Import ".\PEER_PRESENCE_INFO.ahk" { PEER_PRESENCE_INFO }
#Import ".\PEER_EVENT_PRESENCE_CHANGED_DATA.ahk" { PEER_EVENT_PRESENCE_CHANGED_DATA }
#Import ".\PEER_CONTACT.ahk" { PEER_CONTACT }
#Import ".\PEER_APPLICATION.ahk" { PEER_APPLICATION }
#Import ".\PEER_EVENT_REQUEST_STATUS_CHANGED_DATA.ahk" { PEER_EVENT_REQUEST_STATUS_CHANGED_DATA }
#Import ".\PEER_COLLAB_EVENT_TYPE.ahk" { PEER_COLLAB_EVENT_TYPE }
#Import ".\PEER_EVENT_OBJECT_CHANGED_DATA.ahk" { PEER_EVENT_OBJECT_CHANGED_DATA }
#Import ".\PEER_EVENT_APPLICATION_CHANGED_DATA.ahk" { PEER_EVENT_APPLICATION_CHANGED_DATA }

/**
 * The PEER_COLLAB_EVENT_DATA structure (p2p.h) contains variant data for each possible peer collaboration network event raised on a peer.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_collab_event_data~r1
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_COLLAB_EVENT_DATA {
    #StructPack 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_collab_event_type">PEER_COLLAB_EVENT_TYPE</a> enumeration value that contains the type of the event whose corresponding data structure appears in the subsequent union arm.
     * @deprecated
     */
    eventType : PEER_COLLAB_EVENT_TYPE

    /**
     * @deprecated
     */
    watchListChangedData : PEER_EVENT_WATCHLIST_CHANGED_DATA

    static __New() {
        DefineProp(this.Prototype, 'presenceChangedData', { type: PEER_EVENT_PRESENCE_CHANGED_DATA, offset: 8 })
        DefineProp(this.Prototype, 'applicationChangedData', { type: PEER_EVENT_APPLICATION_CHANGED_DATA, offset: 8 })
        DefineProp(this.Prototype, 'objectChangedData', { type: PEER_EVENT_OBJECT_CHANGED_DATA, offset: 8 })
        DefineProp(this.Prototype, 'endpointChangedData', { type: PEER_EVENT_ENDPOINT_CHANGED_DATA, offset: 8 })
        DefineProp(this.Prototype, 'peopleNearMeChangedData', { type: PEER_EVENT_PEOPLE_NEAR_ME_CHANGED_DATA, offset: 8 })
        DefineProp(this.Prototype, 'requestStatusChangedData', { type: PEER_EVENT_REQUEST_STATUS_CHANGED_DATA, offset: 8 })
        this.DeleteProp("__New")
    }
}
