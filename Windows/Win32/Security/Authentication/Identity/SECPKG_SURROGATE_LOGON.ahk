#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_SURROGATE_LOGON extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    SurrogateLogonID{
        get {
            if(!this.HasProp("__SurrogateLogonID"))
                this.__SurrogateLogonID := LUID(4, this)
            return this.__SurrogateLogonID
        }
    }

    /**
     * @type {Integer}
     */
    EntryCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<SECPKG_SURROGATE_LOGON_ENTRY>}
     */
    Entries {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
