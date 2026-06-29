#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The PEER_EVENT_SYNCHRONIZED_DATA is pointed to by a PEER_GRAPH_EVENT_DATA structure's union if a PEER_GRAPH_EVENT_RECORD_CHANGE or PEER_GROUP_EVENT_RECORD_CHANGE event is triggered.
 * @remarks
 * This event only occurs if an application has specified a record synchronization precedence in a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_synchronized_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEER_EVENT_SYNCHRONIZED_DATA {
    #StructPack 4

    /**
     * Specifies the size of the structure.
     */
    dwSize : UInt32

    /**
     * Specifies the type of record that is being synchronized.
     */
    recordType : Guid

}
