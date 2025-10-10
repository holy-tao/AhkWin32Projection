#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include .\KERB_CRYPTO_KEY.ahk

/**
 * Contains information about an external ticket.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-kerb_external_ticket
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_EXTERNAL_TICKET extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_external_name">KERB_EXTERNAL_NAME</a> structure that contains a multiple part, canonical, returned service name.
     * @type {Pointer<KERB_EXTERNAL_NAME>}
     */
    ServiceName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_external_name">KERB_EXTERNAL_NAME</a> structure that contains the multiple part <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">service principal name</a> (SPN).
     * @type {Pointer<KERB_EXTERNAL_NAME>}
     */
    TargetName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_external_name">KERB_EXTERNAL_NAME</a> structure that contains the client name in the ticket. This name is relative to the current domain.
     * @type {Pointer<KERB_EXTERNAL_NAME>}
     */
    ClientName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the domain that corresponds to the <b>ServiceName</b> member. This is the domain that issued the ticket.
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__DomainName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains the name of the domain in which the ticket is valid. For an interdomain ticket, this is the destination domain.
     * @type {LSA_UNICODE_STRING}
     */
    TargetDomainName{
        get {
            if(!this.HasProp("__TargetDomainName"))
                this.__TargetDomainName := LSA_UNICODE_STRING(this.ptr + 40)
            return this.__TargetDomainName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/subauth/ns-subauth-unicode_string">UNICODE_STRING</a> that contains a synonym for the destination domain. Every domain has two names: a DNS name and a NetBIOS name. If the name returned in the ticket is different from the name used to request the ticket (the Kerberos <a href="https://docs.microsoft.com/windows/desktop/SecGloss/k-gly">Key Distribution Center</a> (KDC) may do name mapping), this string contains the original name.
     * @type {LSA_UNICODE_STRING}
     */
    AltTargetDomainName{
        get {
            if(!this.HasProp("__AltTargetDomainName"))
                this.__AltTargetDomainName := LSA_UNICODE_STRING(this.ptr + 56)
            return this.__AltTargetDomainName
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_crypto_key">KERB_CRYPTO_KEY</a> structure that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">session key</a> for the ticket.
     * @type {KERB_CRYPTO_KEY}
     */
    SessionKey{
        get {
            if(!this.HasProp("__SessionKey"))
                this.__SessionKey := KERB_CRYPTO_KEY(this.ptr + 72)
            return this.__SessionKey
        }
    }

    /**
     * 
     * @type {Integer}
     */
    TicketFlags {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Reserved for future use. Set this member to zero.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the key expires.
     * @type {Integer}
     */
    KeyExpirationTime {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the ticket becomes valid.
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 104, "int64")
        set => NumPut("int64", value, this, 104)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the ticket expires.
     * @type {Integer}
     */
    EndTime {
        get => NumGet(this, 112, "int64")
        set => NumPut("int64", value, this, 112)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the latest time a ticket can be renewed. Renewal requests sent after this time will be rejected.
     * @type {Integer}
     */
    RenewUntil {
        get => NumGet(this, 120, "int64")
        set => NumPut("int64", value, this, 120)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the measured time difference between the current time on the computer issuing the ticket and the computer where the ticket will be used.
     * @type {Integer}
     */
    TimeSkew {
        get => NumGet(this, 128, "int64")
        set => NumPut("int64", value, this, 128)
    }

    /**
     * The size, in bytes, of the encoded ticket.
     * @type {Integer}
     */
    EncodedTicketSize {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * A buffer that contains the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1)-encoded ticket.
     * @type {Pointer<Byte>}
     */
    EncodedTicket {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
