#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winldap/ns-winldap-ldapmodw
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 * @charset Unicode
 */
class LDAPModW extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    class _mod_vals_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<PWSTR>}
         */
        modv_strvals {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Pointer<LDAP_BERVAL>>}
         */
        modv_bvals {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
    }

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
    mod_type {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {_mod_vals_e__Union}
     */
    mod_vals{
        get {
            if(!this.HasProp("__mod_vals"))
                this.__mod_vals := %this.__Class%._mod_vals_e__Union(16, this)
            return this.__mod_vals
        }
    }
}
