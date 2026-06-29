#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }

/**
 * The PolicyPrimaryDomainInformation value and POLICY_PRIMARY_DOMAIN_INFO structure are obsolete. Use the PolicyDnsDomainInformation and POLICY_DNS_DOMAIN_INFO structure instead.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-policy_primary_domain_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_PRIMARY_DOMAIN_INFO {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the name of the primary domain.
     */
    Name : LSA_UNICODE_STRING

    /**
     * Pointer to the SID of the primary domain.
     */
    Sid : PSID

}
