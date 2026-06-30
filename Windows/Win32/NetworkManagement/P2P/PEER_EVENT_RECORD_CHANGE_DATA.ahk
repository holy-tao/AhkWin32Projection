#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_RECORD_CHANGE_TYPE.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Points to the PEER_EVENT_RECORD_CHANGE_DATA structure if one of the following peer events is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_record_change_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class PEER_EVENT_RECORD_CHANGE_DATA extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * Specifies the size of a structure.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the type of change to a record or record type.
     * @deprecated
     * @type {PEER_RECORD_CHANGE_TYPE}
     */
    changeType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the unique  ID of a changed record.
     * @type {Guid}
     */
    recordId {
        get {
            if(!this.HasProp("__recordId"))
                this.__recordId := Guid(8, this)
            return this.__recordId
        }
    }

    /**
     * Specifies the unique  record type of a changed record.
     * @type {Guid}
     */
    recordType {
        get {
            if(!this.HasProp("__recordType"))
                this.__recordType := Guid(24, this)
            return this.__recordType
        }
    }
}
