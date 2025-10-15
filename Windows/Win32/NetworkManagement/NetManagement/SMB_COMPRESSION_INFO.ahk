#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class SMB_COMPRESSION_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOLEAN}
     */
    Switch{
        get {
            if(!this.HasProp("__Switch"))
                this.__Switch := BOOLEAN(this.ptr + 0)
            return this.__Switch
        }
    }

    /**
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
