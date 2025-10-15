#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class REPL_IDIR_INFO_1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    rpid1_dirname{
        get {
            if(!this.HasProp("__rpid1_dirname"))
                this.__rpid1_dirname := PWSTR(this.ptr + 0)
            return this.__rpid1_dirname
        }
    }

    /**
     * @type {Integer}
     */
    rpid1_state {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    rpid1_mastername{
        get {
            if(!this.HasProp("__rpid1_mastername"))
                this.__rpid1_mastername := PWSTR(this.ptr + 16)
            return this.__rpid1_mastername
        }
    }

    /**
     * @type {Integer}
     */
    rpid1_last_update_time {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    rpid1_lockcount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    rpid1_locktime {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
