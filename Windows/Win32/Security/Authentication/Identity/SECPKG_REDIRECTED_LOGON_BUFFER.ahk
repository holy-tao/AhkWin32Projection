#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SECPKG_REDIRECTED_LOGON_BUFFER extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Guid}
     */
    RedirectedLogonGuid {
        get {
            if(!this.HasProp("__RedirectedLogonGuid"))
                this.__RedirectedLogonGuid := Guid(0, this)
            return this.__RedirectedLogonGuid
        }
    }

    /**
     * @type {HANDLE}
     */
    RedirectedLogonHandle {
        get {
            if(!this.HasProp("__RedirectedLogonHandle"))
                this.__RedirectedLogonHandle := HANDLE(16, this)
            return this.__RedirectedLogonHandle
        }
    }

    /**
     * @type {Pointer<PLSA_REDIRECTED_LOGON_INIT>}
     */
    Init {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<PLSA_REDIRECTED_LOGON_CALLBACK>}
     */
    Callback {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK>}
     */
    CleanupCallback {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<PLSA_REDIRECTED_LOGON_GET_LOGON_CREDS>}
     */
    GetLogonCreds {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<PLSA_REDIRECTED_LOGON_GET_SUPP_CREDS>}
     */
    GetSupplementalCreds {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<PLSA_REDIRECTED_LOGON_GET_SID>}
     */
    GetRedirectedLogonSid {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
