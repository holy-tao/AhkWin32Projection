#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ADDRESS_LIST_DESCRIPTOR.ahk
#Include ..\Ndis\NETWORK_ADDRESS_LIST.ahk
#Include ..\Ndis\NETWORK_ADDRESS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
class TC_SUPPORTED_INFO_BUFFER extends Win32Struct {
    static sizeof => 544

    static packingSize => 8

    /**
     * @type {Integer}
     */
    InstanceIDLength {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {String}
     */
    InstanceID {
        get => StrGet(this.ptr + 2, 255, "UTF-16")
        set => StrPut(value, this.ptr + 2, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    InterfaceLuid {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }

    /**
     * @type {ADDRESS_LIST_DESCRIPTOR}
     */
    AddrListDesc {
        get {
            if(!this.HasProp("__AddrListDesc"))
                this.__AddrListDesc := ADDRESS_LIST_DESCRIPTOR(528, this)
            return this.__AddrListDesc
        }
    }
}
