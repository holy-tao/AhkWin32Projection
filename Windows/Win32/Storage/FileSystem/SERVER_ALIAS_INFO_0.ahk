#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SERVER_ALIAS_INFO_0 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    srvai0_alias{
        get {
            if(!this.HasProp("__srvai0_alias"))
                this.__srvai0_alias := PWSTR(this.ptr + 0)
            return this.__srvai0_alias
        }
    }

    /**
     * @type {PWSTR}
     */
    srvai0_target{
        get {
            if(!this.HasProp("__srvai0_target"))
                this.__srvai0_target := PWSTR(this.ptr + 8)
            return this.__srvai0_target
        }
    }

    /**
     * @type {Integer}
     */
    srvai0_default {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    srvai0_reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
