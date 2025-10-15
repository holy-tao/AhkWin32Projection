#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class REPL_INFO_0 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    rp0_role {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    rp0_exportpath{
        get {
            if(!this.HasProp("__rp0_exportpath"))
                this.__rp0_exportpath := PWSTR(this.ptr + 8)
            return this.__rp0_exportpath
        }
    }

    /**
     * @type {PWSTR}
     */
    rp0_exportlist{
        get {
            if(!this.HasProp("__rp0_exportlist"))
                this.__rp0_exportlist := PWSTR(this.ptr + 16)
            return this.__rp0_exportlist
        }
    }

    /**
     * @type {PWSTR}
     */
    rp0_importpath{
        get {
            if(!this.HasProp("__rp0_importpath"))
                this.__rp0_importpath := PWSTR(this.ptr + 24)
            return this.__rp0_importpath
        }
    }

    /**
     * @type {PWSTR}
     */
    rp0_importlist{
        get {
            if(!this.HasProp("__rp0_importlist"))
                this.__rp0_importlist := PWSTR(this.ptr + 32)
            return this.__rp0_importlist
        }
    }

    /**
     * @type {PWSTR}
     */
    rp0_logonusername{
        get {
            if(!this.HasProp("__rp0_logonusername"))
                this.__rp0_logonusername := PWSTR(this.ptr + 40)
            return this.__rp0_logonusername
        }
    }

    /**
     * @type {Integer}
     */
    rp0_interval {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    rp0_pulse {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    rp0_guardtime {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    rp0_random {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
