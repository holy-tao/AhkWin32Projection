#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\PEER_EVENT_INCOMING_DATA.ahk" { PEER_EVENT_INCOMING_DATA }
#Import ".\PEER_EVENT_RECORD_CHANGE_DATA.ahk" { PEER_EVENT_RECORD_CHANGE_DATA }
#Import ".\PEER_GRAPH_EVENT_TYPE.ahk" { PEER_GRAPH_EVENT_TYPE }
#Import ".\PEER_GRAPH_STATUS_FLAGS.ahk" { PEER_GRAPH_STATUS_FLAGS }
#Import ".\PEER_RECORD_CHANGE_TYPE.ahk" { PEER_RECORD_CHANGE_TYPE }
#Import ".\PEER_EVENT_SYNCHRONIZED_DATA.ahk" { PEER_EVENT_SYNCHRONIZED_DATA }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PEER_CONNECTION_STATUS.ahk" { PEER_CONNECTION_STATUS }
#Import ".\PEER_DATA.ahk" { PEER_DATA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\PEER_NODE_CHANGE_TYPE.ahk" { PEER_NODE_CHANGE_TYPE }
#Import ".\PEER_EVENT_CONNECTION_CHANGE_DATA.ahk" { PEER_EVENT_CONNECTION_CHANGE_DATA }
#Import ".\PEER_EVENT_NODE_CHANGE_DATA.ahk" { PEER_EVENT_NODE_CHANGE_DATA }

/**
 * The PEER_GRAPH_EVENT_DATA structure contains data associated with a peer event.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_graph_event_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_GRAPH_EVENT_DATA {
    #StructPack 8

    /**
     * The type of peer event this data corresponds to. Must be one of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_graph_event_type">PEER_GRAPH_EVENT_TYPE</a> values. The members that remain are given values based on the peer event type that has occurred.  Not all members contain data.
     * @deprecated
     */
    eventType : PEER_GRAPH_EVENT_TYPE

    /**
     * @deprecated
     */
    dwStatus : PEER_GRAPH_STATUS_FLAGS

    static __New() {
        DefineProp(this.Prototype, 'incomingData', { type: PEER_EVENT_INCOMING_DATA, offset: 8 })
        DefineProp(this.Prototype, 'recordChangeData', { type: PEER_EVENT_RECORD_CHANGE_DATA, offset: 8 })
        DefineProp(this.Prototype, 'connectionChangeData', { type: PEER_EVENT_CONNECTION_CHANGE_DATA, offset: 8 })
        DefineProp(this.Prototype, 'nodeChangeData', { type: PEER_EVENT_NODE_CHANGE_DATA, offset: 8 })
        DefineProp(this.Prototype, 'synchronizedData', { type: PEER_EVENT_SYNCHRONIZED_DATA, offset: 8 })
        this.DeleteProp("__New")
    }
}
