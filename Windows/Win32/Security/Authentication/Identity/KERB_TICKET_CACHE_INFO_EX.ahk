#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_TICKET_CACHE_INFO_EX extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ClientName{
        get {
            if(!this.HasProp("__ClientName"))
                this.__ClientName := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__ClientName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ClientRealm{
        get {
            if(!this.HasProp("__ClientRealm"))
                this.__ClientRealm := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__ClientRealm
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ServerName{
        get {
            if(!this.HasProp("__ServerName"))
                this.__ServerName := LSA_UNICODE_STRING(this.ptr + 32)
            return this.__ServerName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ServerRealm{
        get {
            if(!this.HasProp("__ServerRealm"))
                this.__ServerRealm := LSA_UNICODE_STRING(this.ptr + 48)
            return this.__ServerRealm
        }
    }

    /**
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    EndTime {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    RenewTime {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    EncryptionType {
        get => NumGet(this, 88, "int")
        set => NumPut("int", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    TicketFlags {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
