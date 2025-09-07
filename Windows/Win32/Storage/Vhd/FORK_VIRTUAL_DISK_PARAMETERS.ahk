#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class FORK_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    ForkedVirtualDiskPath{
        get {
            if(!this.HasProp("__ForkedVirtualDiskPath"))
                this.__ForkedVirtualDiskPath := PWSTR(this.ptr + 8)
            return this.__ForkedVirtualDiskPath
        }
    }
}
