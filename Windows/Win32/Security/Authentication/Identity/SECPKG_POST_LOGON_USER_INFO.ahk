#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_POST_LOGON_USER_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 8)
            return this.__LogonId
        }
    }

    /**
     * @type {LUID}
     */
    LinkedLogonId{
        get {
            if(!this.HasProp("__LinkedLogonId"))
                this.__LinkedLogonId := LUID(this.ptr + 16)
            return this.__LinkedLogonId
        }
    }
}
