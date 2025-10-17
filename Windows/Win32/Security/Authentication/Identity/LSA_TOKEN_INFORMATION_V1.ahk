#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\SID_AND_ATTRIBUTES.ahk
#Include ..\..\TOKEN_USER.ahk
#Include ..\..\TOKEN_PRIMARY_GROUP.ahk
#Include ..\..\TOKEN_OWNER.ahk
#Include ..\..\TOKEN_DEFAULT_DACL.ahk

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
                this.__User := TOKEN_USER(8, this)
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
     * @type {TOKEN_PRIMARY_GROUP}
     */
    PrimaryGroup{
        get {
            if(!this.HasProp("__PrimaryGroup"))
                this.__PrimaryGroup := TOKEN_PRIMARY_GROUP(32, this)
            return this.__PrimaryGroup
        }
    }

    /**
     * @type {Pointer<TOKEN_PRIVILEGES>}
     */
    Privileges {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {TOKEN_OWNER}
     */
    Owner{
        get {
            if(!this.HasProp("__Owner"))
                this.__Owner := TOKEN_OWNER(48, this)
            return this.__Owner
        }
    }

    /**
     * @type {TOKEN_DEFAULT_DACL}
     */
    DefaultDacl{
        get {
            if(!this.HasProp("__DefaultDacl"))
                this.__DefaultDacl := TOKEN_DEFAULT_DACL(56, this)
            return this.__DefaultDacl
        }
    }
}
