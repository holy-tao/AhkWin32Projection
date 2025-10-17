#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\NETLOGON_LOGON_IDENTITY_INFO.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class NETLOGON_GENERIC_INFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {NETLOGON_LOGON_IDENTITY_INFO}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := NETLOGON_LOGON_IDENTITY_INFO(0, this)
            return this.__Identity
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    PackageName{
        get {
            if(!this.HasProp("__PackageName"))
                this.__PackageName := LSA_UNICODE_STRING(64, this)
            return this.__PackageName
        }
    }

    /**
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<Byte>}
     */
    LogonData {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
