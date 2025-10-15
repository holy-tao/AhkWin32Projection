#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk
#Include .\LSA_UNICODE_STRING.ahk
#Include ..\..\PSID.ahk

/**
 * The PolicyPrimaryDomainInformation value and POLICY_PRIMARY_DOMAIN_INFO structure are obsolete. Use the PolicyDnsDomainInformation and POLICY_DNS_DOMAIN_INFO structure instead.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ns-ntsecapi-policy_primary_domain_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_PRIMARY_DOMAIN_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the name of the primary domain.
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
     * Pointer to the SID of the primary domain.
     * @type {PSID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := PSID(this.ptr + 16)
            return this.__Sid
        }
    }
}
