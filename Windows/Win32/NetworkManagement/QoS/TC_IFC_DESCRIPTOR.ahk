#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NETWORK_ADDRESS.ahk
#Include ..\Ndis\NETWORK_ADDRESS_LIST.ahk
#Include .\ADDRESS_LIST_DESCRIPTOR.ahk

/**
 * The TC_IFC_DESCRIPTOR structure is an interface identifier used to enumerate interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/traffic/ns-traffic-tc_ifc_descriptor
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class TC_IFC_DESCRIPTOR extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Number of bytes from the beginning of the 
     * <b>TC_IFC_DESCRIPTOR</b> to the next 
     * <b>TC_IFC_DESCRIPTOR</b>.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a zero-terminated Unicode string representing the name of the packet shaper interface. This name is used in subsequent TC API calls to reference the interface.
     * @type {Pointer<Char>}
     */
    pInterfaceName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a zero-terminated Unicode string naming the DeviceName of the interface.
     * @type {Pointer<Char>}
     */
    pInterfaceID {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Network address list descriptor.
     * @type {ADDRESS_LIST_DESCRIPTOR}
     */
    AddressListDesc{
        get {
            if(!this.HasProp("__AddressListDesc"))
                this.__AddressListDesc := ADDRESS_LIST_DESCRIPTOR(this.ptr + 24)
            return this.__AddressListDesc
        }
    }
}
