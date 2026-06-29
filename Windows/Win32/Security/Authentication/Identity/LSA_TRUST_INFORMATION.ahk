#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Identifies a domain.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms722475(v=vs.85)">TRUSTED_DOMAIN_INFORMATION_BASIC</a> is an alias for this structure.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms722475(v=vs.85)">TRUSTED_DOMAIN_INFORMATION_BASIC</a> structure identifies a domain. This structure is used by the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsaquerytrusteddomaininfo">LsaQueryTrustedDomainInfo</a> function when its <i>InformationClass</i> parameter is set to <b>TrustedDomainInformationBasic</b>.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-lsa_trust_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct LSA_TRUST_INFORMATION {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of the domain.
     */
    Name : LSA_UNICODE_STRING

    /**
     * Pointer to the SID of the domain.
     */
    Sid : PSID

}
