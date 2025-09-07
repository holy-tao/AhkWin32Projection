#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk
#Include .\PEER_EVENT_INCOMING_DATA.ahk
#Include .\PEER_EVENT_RECORD_CHANGE_DATA.ahk
#Include .\PEER_EVENT_CONNECTION_CHANGE_DATA.ahk
#Include .\PEER_EVENT_MEMBER_CHANGE_DATA.ahk

/**
 * The PEER_GROUP_EVENT_DATA structure (p2p.h) contains information about a specific peer group event that has occurred.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_group_event_data~r1
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GROUP_EVENT_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/p2p/ne-p2p-peer_group_event_type">PEER_GROUP_EVENT_TYPE</a> enumeration value that specifies  the type of peer group event that occurred. The type of event dictates the subsequent structure chosen from the union; for example, if this value is set to PEER_GROUP_EVENT_INCOMING_DATA, the populated union member is  <b>incomingData</b>.
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
                this.__incomingData := PEER_EVENT_INCOMING_DATA(this.ptr + 8)
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
                this.__recordChangeData := PEER_EVENT_RECORD_CHANGE_DATA(this.ptr + 8)
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
                this.__connectionChangeData := PEER_EVENT_CONNECTION_CHANGE_DATA(this.ptr + 8)
            return this.__connectionChangeData
        }
    }

    /**
     * @deprecated
     * @type {PEER_EVENT_MEMBER_CHANGE_DATA}
     */
    memberChangeData{
        get {
            if(!this.HasProp("__memberChangeData"))
                this.__memberChangeData := PEER_EVENT_MEMBER_CHANGE_DATA(this.ptr + 8)
            return this.__memberChangeData
        }
    }

    /**
     * @type {Integer}
     */
    hrConnectionFailedReason {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
