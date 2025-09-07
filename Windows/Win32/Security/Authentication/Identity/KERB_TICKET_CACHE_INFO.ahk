#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * Contains information about a cached Kerberos ticket. The Kerberos ticket is defined in Internet RFC 4120. For more information, see http://www.ietf.org.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-kerb_ticket_cache_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_TICKET_CACHE_INFO extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the server the ticket applies to. This name is combined with the <b>RealmName</b> value to create the full name <b>ServerName</b>@<b>RealmName</b>.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the realm the ticket applies to.
     * @type {LSA_UNICODE_STRING}
     */
    RealmName{
        get {
            if(!this.HasProp("__RealmName"))
                this.__RealmName := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__RealmName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the ticket becomes valid. If the <b>starttime</b> member of the ticket is not set, this value defaults to the time when the ticket was initially authenticated, <b>authtime</b>. The <b>starttime</b> member of a ticket is optional.
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time when the ticket expires.
     * @type {Integer}
     */
    EndTime {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * If KERB_TICKET_FLAGS_renewable is set in <b>TicketFlags</b>, this member is a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time beyond which the ticket cannot be renewed.
     * @type {Integer}
     */
    RenewTime {
        get => NumGet(this, 48, "int64")
        set => NumPut("int64", value, this, 48)
    }

    /**
     * The type of encryption used in the ticket.
     * @type {Integer}
     */
    EncryptionType {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    TicketFlags {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }
}
