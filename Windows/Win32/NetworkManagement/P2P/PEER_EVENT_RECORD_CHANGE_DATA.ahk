#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Points to the PEER_EVENT_RECORD_CHANGE_DATA structure if one of the following peer events is triggered.
 * @see https://learn.microsoft.com/windows/win32/api/p2p/ns-p2p-peer_event_record_change_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_EVENT_RECORD_CHANGE_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {Integer}
     */
    changeType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the unique  ID of a changed record.
     * @type {Pointer<Guid>}
     */
    recordId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the unique  record type of a changed record.
     * @type {Pointer<Guid>}
     */
    recordType {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
