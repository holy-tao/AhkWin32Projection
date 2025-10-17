#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NETWORK_ADDRESS.ahk
#Include ..\Ndis\NETWORK_ADDRESS_LIST.ahk

/**
 * The ADDRESS_LIST_DESCRIPTOR structure provides network address descriptor information for a given interface.
 * @see https://docs.microsoft.com/windows/win32/api//traffic/ns-traffic-address_list_descriptor
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class ADDRESS_LIST_DESCRIPTOR extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Media type of the interface.
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the address list for the interface. The <b>NETWORK_ADDRESS_LIST</b> structure is defined in Ntddndis.h.
     * @type {NETWORK_ADDRESS_LIST}
     */
    AddressList{
        get {
            if(!this.HasProp("__AddressList"))
                this.__AddressList := NETWORK_ADDRESS_LIST(8, this)
            return this.__AddressList
        }
    }
}
