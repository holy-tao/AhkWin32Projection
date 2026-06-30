#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class HVSOCKET_ADDRESS_INFO extends Win32Struct {
    static sizeof => 52

    static packingSize => 4

    /**
     * @type {Guid}
     */
    SystemId {
        get {
            if(!this.HasProp("__SystemId"))
                this.__SystemId := Guid(0, this)
            return this.__SystemId
        }
    }

    /**
     * @type {Guid}
     */
    VirtualMachineId {
        get {
            if(!this.HasProp("__VirtualMachineId"))
                this.__VirtualMachineId := Guid(16, this)
            return this.__VirtualMachineId
        }
    }

    /**
     * @type {Guid}
     */
    SiloId {
        get {
            if(!this.HasProp("__SiloId"))
                this.__SiloId := Guid(32, this)
            return this.__SiloId
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
