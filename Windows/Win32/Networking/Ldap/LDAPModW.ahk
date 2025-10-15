#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 * @charset Unicode
 */
class LDAPModW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    mod_op {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    mod_type{
        get {
            if(!this.HasProp("__mod_type"))
                this.__mod_type := PWSTR(this.ptr + 8)
            return this.__mod_type
        }
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    modv_strvals {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<LDAP_BERVAL>}
     */
    modv_bvals {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
