#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_CALL_PACKAGE_TRANSFER_CRED_REQUEST extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    OriginLogonId{
        get {
            if(!this.HasProp("__OriginLogonId"))
                this.__OriginLogonId := LUID(this.ptr + 8)
            return this.__OriginLogonId
        }
    }

    /**
     * @type {LUID}
     */
    DestinationLogonId{
        get {
            if(!this.HasProp("__DestinationLogonId"))
                this.__DestinationLogonId := LUID(this.ptr + 16)
            return this.__DestinationLogonId
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
