#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Networking\WinSock\ADDRESS_FAMILY.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class SOCKADDR_HV extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {ADDRESS_FAMILY}
     */
    Family {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Guid}
     */
    VmId {
        get {
            if(!this.HasProp("__VmId"))
                this.__VmId := Guid(4, this)
            return this.__VmId
        }
    }

    /**
     * @type {Guid}
     */
    ServiceId {
        get {
            if(!this.HasProp("__ServiceId"))
                this.__ServiceId := Guid(20, this)
            return this.__ServiceId
        }
    }
}
