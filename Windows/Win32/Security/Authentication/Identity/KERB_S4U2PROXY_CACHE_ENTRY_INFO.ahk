#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\..\Foundation\NTSTATUS.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_S4U2PROXY_CACHE_ENTRY_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ServerName{
        get {
            if(!this.HasProp("__ServerName"))
                this.__ServerName := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__ServerName
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {NTSTATUS}
     */
    LastStatus{
        get {
            if(!this.HasProp("__LastStatus"))
                this.__LastStatus := NTSTATUS(this.ptr + 20)
            return this.__LastStatus
        }
    }

    /**
     * @type {Integer}
     */
    Expiry {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
