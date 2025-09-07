#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_SRIOV_RESOURCE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 416

    static packingSize => 8

    /**
     * @type {String}
     */
    PnpInstanceId {
        get => StrGet(this.ptr + 0, 199, "UTF-16")
        set => StrPut(value, this.ptr + 0, 199, "UTF-16")
    }

    /**
     * @type {LUID}
     */
    VirtualFunctionId{
        get {
            if(!this.HasProp("__VirtualFunctionId"))
                this.__VirtualFunctionId := LUID(this.ptr + 400)
            return this.__VirtualFunctionId
        }
    }

    /**
     * @type {Integer}
     */
    VirtualFunctionIndex {
        get => NumGet(this, 408, "ushort")
        set => NumPut("ushort", value, this, 408)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 410, "ushort")
        set => NumPut("ushort", value, this, 410)
    }
}
