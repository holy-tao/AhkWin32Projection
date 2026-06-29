#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include .\NET_FL_ISOLATION_MODE.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include ..\..\Networking\WinSock\ADDRESS_FAMILY.ahk
#Include .\MIB_FL_VIRTUAL_INTERFACE_ROW.ahk
#Include .\NET_FL_VIRTUAL_INTERFACE_ORIGIN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
class MIB_FL_VIRTUAL_INTERFACE_TABLE extends Win32Struct {
    static sizeof => 216

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {MIB_FL_VIRTUAL_INTERFACE_ROW}
     */
    Table {
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_FL_VIRTUAL_INTERFACE_ROW, "")
            return this.__TableProxyArray
        }
    }
}
