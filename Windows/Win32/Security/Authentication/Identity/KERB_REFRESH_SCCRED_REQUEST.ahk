#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_REFRESH_SCCRED_REQUEST extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    CredentialBlob{
        get {
            if(!this.HasProp("__CredentialBlob"))
                this.__CredentialBlob := LSA_UNICODE_STRING(8, this)
            return this.__CredentialBlob
        }
    }

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(24, this)
            return this.__LogonId
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
