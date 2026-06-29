#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Contains identifying information for a domain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_domain_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_FOREST_TRUST_DOMAIN_INFO {
    #StructPack 8

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> of the domain.
     */
    Sid : PSID

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the DNS name of the domain.
     */
    DnsName : LSA_UNICODE_STRING

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the NetBIOS name of the domain.
     */
    NetbiosName : LSA_UNICODE_STRING

}
