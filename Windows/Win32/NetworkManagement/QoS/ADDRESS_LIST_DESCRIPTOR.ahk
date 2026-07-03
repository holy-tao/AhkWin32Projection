#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NETWORK_ADDRESS.ahk" { NETWORK_ADDRESS }
#Import "..\Ndis\NETWORK_ADDRESS_LIST.ahk" { NETWORK_ADDRESS_LIST }

/**
 * The ADDRESS_LIST_DESCRIPTOR structure provides network address descriptor information for a given interface.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-address_list_descriptor
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct ADDRESS_LIST_DESCRIPTOR {
    #StructPack 4

    /**
     * Media type of the interface.
     */
    MediaType : UInt32

    /**
     * Pointer to the address list for the interface. The <b>NETWORK_ADDRESS_LIST</b> structure is defined in Ntddndis.h.
     */
    AddressList : NETWORK_ADDRESS_LIST

}
