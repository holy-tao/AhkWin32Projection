#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to query or set the name of a trusted domain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-trusted_domain_name_info
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_NAME_INFO {
    #StructPack 8

    /**
     * An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lsalookup/ns-lsalookup-lsa_unicode_string">LSA_UNICODE_STRING</a> structure that contains the name of a trusted domain.
     */
    Name : LSA_UNICODE_STRING

}
