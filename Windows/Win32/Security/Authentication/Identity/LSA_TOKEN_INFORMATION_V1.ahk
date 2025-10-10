#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\SID_AND_ATTRIBUTES.ahk
#Include ..\..\TOKEN_USER.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_TOKEN_INFORMATION_V1 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ExpirationTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {TOKEN_USER}
     */
    User{
        get {
            if(!this.HasProp("__User"))
                this.__User := TOKEN_USER(this.ptr + 8)
            return this.__User
        }
    }

    /**
     * @type {Pointer<TOKEN_GROUPS>}
     */
    Groups {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Void>}
     */
    PrimaryGroup {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<TOKEN_PRIVILEGES>}
     */
    Privileges {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Void>}
     */
    Owner {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<TypeHandle>}
     */
    DefaultDacl {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
