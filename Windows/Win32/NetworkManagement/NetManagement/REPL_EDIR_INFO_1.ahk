#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class REPL_EDIR_INFO_1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    rped1_dirname{
        get {
            if(!this.HasProp("__rped1_dirname"))
                this.__rped1_dirname := PWSTR(this.ptr + 0)
            return this.__rped1_dirname
        }
    }

    /**
     * @type {Integer}
     */
    rped1_integrity {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    rped1_extent {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
