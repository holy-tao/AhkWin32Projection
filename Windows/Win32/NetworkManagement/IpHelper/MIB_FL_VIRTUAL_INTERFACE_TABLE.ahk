#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NET_LUID_LH.ahk
#Include .\MIB_FL_VIRTUAL_INTERFACE_ROW.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_FL_VIRTUAL_INTERFACE_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<MIB_FL_VIRTUAL_INTERFACE_ROW>}
     */
    Table{
        get {
            if(!this.HasProp("__TableProxyArray"))
                this.__TableProxyArray := Win32FixedArray(this.ptr + 8, 1, MIB_FL_VIRTUAL_INTERFACE_ROW, "")
            return this.__TableProxyArray
        }
    }
}
