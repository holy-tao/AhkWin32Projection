#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CLIENT_INFO_EX extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(0, this)
            return this.__LogonId
        }
    }

    /**
     * @type {Integer}
     */
    ProcessID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ThreadID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {BOOLEAN}
     */
    HasTcbPrivilege {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {BOOLEAN}
     */
    Impersonating {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {BOOLEAN}
     */
    Restricted {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    ClientFlags {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * @type {Integer}
     */
    ImpersonationLevel {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {HANDLE}
     */
    ClientToken{
        get {
            if(!this.HasProp("__ClientToken"))
                this.__ClientToken := HANDLE(24, this)
            return this.__ClientToken
        }
    }

    /**
     * @type {LUID}
     */
    IdentificationLogonId{
        get {
            if(!this.HasProp("__IdentificationLogonId"))
                this.__IdentificationLogonId := LUID(32, this)
            return this.__IdentificationLogonId
        }
    }

    /**
     * @type {HANDLE}
     */
    IdentificationToken{
        get {
            if(!this.HasProp("__IdentificationToken"))
                this.__IdentificationToken := HANDLE(40, this)
            return this.__IdentificationToken
        }
    }
}
