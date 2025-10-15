#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * The SECPKG_CLIENT_INFO structure holds information about a security package's client. This structure is used by the GetClientInfo function.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_client_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CLIENT_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The client's effective <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">logon identifier</a>.
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
     * The client's process identifier.
     * @type {Integer}
     */
    ProcessID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The client's thread identifier.
     * @type {Integer}
     */
    ThreadID {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * <b>TRUE</b> if the client has the SeTcbPrivilege privilege; otherwise <b>FALSE</b>.
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
     * <b>TRUE</b> if the client is impersonating another <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security principal</a>.
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
     * The client is restricted in its ability to access securable objects or perform privileged operations.
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
     * 
     * @type {Integer}
     */
    ClientFlags {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * 
     * @type {Integer}
     */
    ImpersonationLevel {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * 
     * @type {HANDLE}
     */
    ClientToken{
        get {
            if(!this.HasProp("__ClientToken"))
                this.__ClientToken := HANDLE(this.ptr + 24)
            return this.__ClientToken
        }
    }
}
