#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk
#Include .\PEER_EVENT_INCOMING_DATA.ahk
#Include .\PEER_EVENT_RECORD_CHANGE_DATA.ahk
#Include .\PEER_EVENT_CONNECTION_CHANGE_DATA.ahk
#Include .\PEER_EVENT_MEMBER_CHANGE_DATA.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_GROUP_EVENT_DATA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
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
     * @type {PEER_EVENT_MEMBER_CHANGE_DATA}
     */
    memberChangeData{
        get {
            if(!this.HasProp("__memberChangeData"))
                this.__memberChangeData := PEER_EVENT_MEMBER_CHANGE_DATA(8, this)
            return this.__memberChangeData
        }
    }

    /**
     * @type {HRESULT}
     */
    hrConnectionFailedReason {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
