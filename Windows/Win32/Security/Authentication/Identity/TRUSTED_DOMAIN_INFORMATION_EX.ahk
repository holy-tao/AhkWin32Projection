#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSID.ahk

/**
 * Used to retrieve extended information about a trusted domain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class TRUSTED_DOMAIN_INFORMATION_EX extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the trusted domain. This is the DNS domain name.  For non-Microsoft trusted domains, this is the identifying name of the domain.
     * @type {LSA_UNICODE_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := LSA_UNICODE_STRING(this.ptr + 0)
            return this.__Name
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the flat name of the trusted domain. For non-Microsoft trusted domains, this is the identifying name of the domain or it is <b>NULL</b>.
     * @type {LSA_UNICODE_STRING}
     */
    FlatName{
        get {
            if(!this.HasProp("__FlatName"))
                this.__FlatName := LSA_UNICODE_STRING(this.ptr + 16)
            return this.__FlatName
        }
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID) of the trusted domain. For non-Microsoft trusted domains, this member can be <b>NULL</b>.
     * @type {PSID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := PSID(this.ptr + 32)
            return this.__Sid
        }
    }

    /**
     * 
     * @type {Integer}
     */
    TrustDirection {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    TrustType {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * 
     * @type {Integer}
     */
    TrustAttributes {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
