#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk
#Include .\PEER_EVENT_INCOMING_DATA.ahk
#Include .\PEER_EVENT_RECORD_CHANGE_DATA.ahk
#Include .\PEER_EVENT_CONNECTION_CHANGE_DATA.ahk
#Include .\PEER_EVENT_NODE_CHANGE_DATA.ahk
#Include .\PEER_EVENT_SYNCHRONIZED_DATA.ahk

/**
 * The PEER_GRAPH_EVENT_DATA structure contains data associated with a peer event.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_graph_event_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GRAPH_EVENT_DATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The type of peer event this data corresponds to. Must be one of the <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_graph_event_type">PEER_GRAPH_EVENT_TYPE</a> values. The members that remain are given values based on the peer event type that has occurred.  Not all members contain data.
     * @deprecated
     * @type {Integer}
     */
    eventType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @deprecated
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_INCOMING_DATA}
     */
    incomingData{
        get {
            if(!this.HasProp("__incomingData"))
                this.__incomingData := PEER_EVENT_INCOMING_DATA(8, this)
            return this.__incomingData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_RECORD_CHANGE_DATA}
     */
    recordChangeData{
        get {
            if(!this.HasProp("__recordChangeData"))
                this.__recordChangeData := PEER_EVENT_RECORD_CHANGE_DATA(8, this)
            return this.__recordChangeData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_CONNECTION_CHANGE_DATA}
     */
    connectionChangeData{
        get {
            if(!this.HasProp("__connectionChangeData"))
                this.__connectionChangeData := PEER_EVENT_CONNECTION_CHANGE_DATA(8, this)
            return this.__connectionChangeData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_NODE_CHANGE_DATA}
     */
    nodeChangeData{
        get {
            if(!this.HasProp("__nodeChangeData"))
                this.__nodeChangeData := PEER_EVENT_NODE_CHANGE_DATA(8, this)
            return this.__nodeChangeData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_SYNCHRONIZED_DATA}
     */
    synchronizedData{
        get {
            if(!this.HasProp("__synchronizedData"))
                this.__synchronizedData := PEER_EVENT_SYNCHRONIZED_DATA(8, this)
            return this.__synchronizedData
        }
    }
}
