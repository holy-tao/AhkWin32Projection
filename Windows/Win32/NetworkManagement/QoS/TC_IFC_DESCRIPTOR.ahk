#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ADDRESS_LIST_DESCRIPTOR.ahk" { ADDRESS_LIST_DESCRIPTOR }
#Import "..\Ndis\NETWORK_ADDRESS.ahk" { NETWORK_ADDRESS }
#Import "..\Ndis\NETWORK_ADDRESS_LIST.ahk" { NETWORK_ADDRESS_LIST }

/**
 * The TC_IFC_DESCRIPTOR structure is an interface identifier used to enumerate interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-tc_ifc_descriptor
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct TC_IFC_DESCRIPTOR {
    #StructPack 8

    /**
     * Number of bytes from the beginning of the 
     * <b>TC_IFC_DESCRIPTOR</b> to the next 
     * <b>TC_IFC_DESCRIPTOR</b>.
     */
    Length : UInt32

    /**
     * Pointer to a zero-terminated Unicode string representing the name of the packet shaper interface. This name is used in subsequent TC API calls to reference the interface.
     */
    pInterfaceName : PWSTR

    /**
     * Pointer to a zero-terminated Unicode string naming the DeviceName of the interface.
     */
    pInterfaceID : PWSTR

    /**
     * Network address list descriptor.
     */
    AddressListDesc : ADDRESS_LIST_DESCRIPTOR

}
