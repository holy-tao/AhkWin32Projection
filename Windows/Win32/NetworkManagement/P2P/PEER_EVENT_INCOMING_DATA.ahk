#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PEER_DATA.ahk

/**
 * Points to the PEER_EVENT_INCOMING_DATA structure if one of the following peer events is triggered.
 * @see https://docs.microsoft.com/windows/win32/api//p2p/ns-p2p-peer_event_incoming_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class PEER_EVENT_INCOMING_DATA extends Win32Struct
{
    static sizeof => 40

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
     * Specifies the unique ID of a data connection.
     * @type {Integer}
     */
    ullConnectionId {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the application-defined data type of  incoming data.
     * @type {Pointer<Guid>}
     */
    type {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies the actual data received.
     * @deprecated 
     * @type {PEER_DATA}
     */
    data{
        get {
            if(!this.HasProp("__data"))
                this.__data := PEER_DATA(24, this)
            return this.__data
        }
    }
}
