#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class REPL_EDIR_INFO_2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    rped2_dirname{
        get {
            if(!this.HasProp("__rped2_dirname"))
                this.__rped2_dirname := PWSTR(this.ptr + 0)
            return this.__rped2_dirname
        }
    }

    /**
     * @type {Integer}
     */
    rped2_integrity {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    rped2_extent {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    rped2_lockcount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    rped2_locktime {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
