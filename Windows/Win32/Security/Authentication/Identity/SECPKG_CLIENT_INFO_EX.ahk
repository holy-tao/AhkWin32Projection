#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk
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
                this.__LogonId := LUID(this.ptr + 0)
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
    HasTcbPrivilege{
        get {
            if(!this.HasProp("__HasTcbPrivilege"))
                this.__HasTcbPrivilege := BOOLEAN(this.ptr + 16)
            return this.__HasTcbPrivilege
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Impersonating{
        get {
            if(!this.HasProp("__Impersonating"))
                this.__Impersonating := BOOLEAN(this.ptr + 17)
            return this.__Impersonating
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Restricted{
        get {
            if(!this.HasProp("__Restricted"))
                this.__Restricted := BOOLEAN(this.ptr + 18)
            return this.__Restricted
        }
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
                this.__ClientToken := HANDLE(this.ptr + 24)
            return this.__ClientToken
        }
    }

    /**
     * @type {LUID}
     */
    IdentificationLogonId{
        get {
            if(!this.HasProp("__IdentificationLogonId"))
                this.__IdentificationLogonId := LUID(this.ptr + 32)
            return this.__IdentificationLogonId
        }
    }

    /**
     * @type {HANDLE}
     */
    IdentificationToken{
        get {
            if(!this.HasProp("__IdentificationToken"))
                this.__IdentificationToken := HANDLE(this.ptr + 40)
            return this.__IdentificationToken
        }
    }
}
