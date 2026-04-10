#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRT_ADDRESS.ahk
#Include ..\..\Networking\WinSock\SOCKADDR_STORAGE.ahk
#Include ..\..\Networking\WinSock\ADDRESS_FAMILY.ahk

/**
 * DRT_ADDRESS_LIST structure contains a set of DRT_ADDRESS structures that represent the nodes contacted during a search for a key.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_address_list
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
class DRT_ADDRESS_LIST extends Win32Struct {
    static sizeof => 152

    static packingSize => 8

    /**
     * The count of entries in <b>AddressList</b>.
     * @type {Integer}
     */
    AddressCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/drt/ns-drt-drt_address">DRT_ADDRESS</a> structures that contain information about addresses that participated  in the search operation.
     * @type {DRT_ADDRESS}
     */
    AddressList {
        get {
            if(!this.HasProp("__AddressListProxyArray"))
                this.__AddressListProxyArray := Win32FixedArray(this.ptr + 8, 1, DRT_ADDRESS, "")
            return this.__AddressListProxyArray
        }
    }
}
