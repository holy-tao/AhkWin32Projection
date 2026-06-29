#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TRUSTED_DOMAIN_TRUST_TYPE.ahk" { TRUSTED_DOMAIN_TRUST_TYPE }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\TRUSTED_DOMAIN_TRUST_ATTRIBUTES.ahk" { TRUSTED_DOMAIN_TRUST_ATTRIBUTES }
#Import ".\TRUSTED_POSIX_OFFSET_INFO.ahk" { TRUSTED_POSIX_OFFSET_INFO }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\LSA_AUTH_INFORMATION.ahk" { LSA_AUTH_INFORMATION }
#Import ".\TRUSTED_DOMAIN_AUTH_INFORMATION.ahk" { TRUSTED_DOMAIN_AUTH_INFORMATION }
#Import ".\TRUSTED_DOMAIN_INFORMATION_EX.ahk" { TRUSTED_DOMAIN_INFORMATION_EX }
#Import ".\TRUSTED_DOMAIN_TRUST_DIRECTION.ahk" { TRUSTED_DOMAIN_TRUST_DIRECTION }
#Import "..\..\PSID.ahk" { PSID }

/**
 * Used to retrieve complete information about a trusted domain.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ns-ntsecapi-trusted_domain_full_information
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct TRUSTED_DOMAIN_FULL_INFORMATION {
    #StructPack 8

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a> structure containing extended information for a trusted domain.
     */
    Information : TRUSTED_DOMAIN_INFORMATION_EX

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_posix_offset_info">TRUSTED_POSIX_OFFSET_INFO</a> structure containing the value used to generate Posix user and group identifiers for a trusted domain.
     */
    PosixOffset : TRUSTED_POSIX_OFFSET_INFO

    /**
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_auth_information">TRUSTED_DOMAIN_AUTH_INFORMATION</a> structure containing authentication information for a trusted domain.
     */
    AuthInformation : TRUSTED_DOMAIN_AUTH_INFORMATION

}
