#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The PEER_EVENT_SYNCHRONIZED_DATA is pointed to by a PEER_GRAPH_EVENT_DATA structure's union if a PEER_GRAPH_EVENT_RECORD_CHANGE or PEER_GROUP_EVENT_RECORD_CHANGE event is triggered.
 * @remarks
 * This event only occurs if an application has specified a record synchronization precedence in a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/p2p/nf-p2p-peergraphopen">PeerGraphOpen</a>.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_synchronized_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_EVENT_SYNCHRONIZED_DATA extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * Specifies the size of the structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the type of record that is being synchronized.
     * @type {Guid}
     */
    recordType {
        get {
            if(!this.HasProp("__recordType"))
                this.__recordType := Guid(4, this)
            return this.__recordType
        }
    }
}
