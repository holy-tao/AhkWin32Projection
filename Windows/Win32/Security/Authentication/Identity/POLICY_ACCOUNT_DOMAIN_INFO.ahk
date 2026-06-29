#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Used to set and query the name and SID of the system's account domain.
 * @see https://learn.microsoft.com/windows/win32/api/lsalookup/ns-lsalookup-policy_account_domain_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct POLICY_ACCOUNT_DOMAIN_INFO {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that specifies the name of the account domain.
     */
    DomainName : LSA_UNICODE_STRING

    /**
     * Pointer to the SID of the account domain.
     */
    DomainSid : PSID

}
