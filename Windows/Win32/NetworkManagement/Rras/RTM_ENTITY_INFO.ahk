#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RTM_ENTITY_ID.ahk

/**
 * The RTM_ENTITY_INFO structure is used to exchange client information with the routing table manager.
 * @see https://docs.microsoft.com/windows/win32/api//rtmv2/ns-rtmv2-rtm_entity_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_ENTITY_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the instance of the routing table manager with which the client registered.
     * @type {Integer}
     */
    RtmInstanceId {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Specifies the address family to which the client belongs.
     * @type {Integer}
     */
    AddressFamily {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Specifies the identifier that uniquely identifies a client.
     * @type {RTM_ENTITY_ID}
     */
    EntityId{
        get {
            if(!this.HasProp("__EntityId"))
                this.__EntityId := RTM_ENTITY_ID(8, this)
            return this.__EntityId
        }
    }
}
